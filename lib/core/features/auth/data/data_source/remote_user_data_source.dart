import 'package:bank/core/_core.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

class RemoteUserDataSource implements UserDataSource {
  DatabaseReference ref = FirebaseDatabase.instance.ref('users');

  Map<String, dynamic> _convertToMap(Object? value) {
    if (value != null) {
      return (value as Map).cast<String, dynamic>();
    }

    return {};
  }

  @override
  Future<Either<Failure, UserDTO>> getUser(String login) async {
    final snapshot = await ref.child(login).get();

    if (snapshot.exists) {
      return Right(
        UserDTO.fromJson(
          {..._convertToMap(snapshot.value), 'login': login},
        ),
      );
    }

    return Left(UserFailure(code: 404, message: 'User not found'));
  }

  @override
  Future<Either<Failure, List<UserDTO>>> getChildren(String login) async {
    final snapshot = await ref.get();

    if (snapshot.exists) {
      final value = _convertToMap(snapshot.value);
      final logins = value.keys;

      return Right(
        logins
            .map((e) {
              return UserDTO.fromJson({
                ..._convertToMap(value[e]),
                'login': e,
              });
            })
            .toList()
            .where((element) => element.parentLogin == login)
            .toList(),
      );
    }

    return Left(UserFailure(code: 404, message: 'User not found'));
  }

  @override
  Future<Either<Failure, AuthDTO>> signIn(String login) async {
    try {
      final userResult = await getUser(login);

      return userResult.fold(Left.new, (r) {
        return Right(AuthDTO(token: login, user: r));
      });
    } catch (_) {
      print(_);
      return Left(UserFailure(code: -1));
    }
  }

  @override
  Future<Either<Failure, AuthDTO>> signUpChild({
    required String login,
    required String lastName,
    required String firstName,
    required String parentLogin,
  }) async {
    Failure? error;

    final result = await getUser(login);

    await result.fold(
      (l) async {
        final result = await getUser(parentLogin);

        return result.fold(
          (l) {
            error = l;
          },
          (r) => null,
        );
      },
      (r) {
        error = UserFailure(code: 409, message: 'User already exists');
      },
    );

    if (error == null) {
      await ref.child(login).set({
        'lastName': lastName,
        'firstName': firstName,
        'parentLogin': parentLogin,
      });

      return signIn(login);
    }

    return Left(error!);
  }

  @override
  Future<Either<Failure, AuthDTO>> signUpParent({
    required String login,
    required String lastName,
    required String firstName,
  }) async {
    final result = await getUser(login);

    return result.fold(
      (l) async {
        await ref.child(login).set({
          'lastName': lastName,
          'firstName': firstName,
        });

        try {
          await _createInvoice(login);
        } catch (_) {
          await ref.child(login).remove();

          return Left(UserFailure(code: 400, message: _.toString()));
        }

        return signIn(login);
      },
      (r) {
        return Left(UserFailure(code: 409, message: 'User already exists'));
      },
    );
  }

  Future<Either<Failure, void>> _createInvoice(String login) async {
    final DatabaseReference _ref = FirebaseDatabase.instance.ref('invoices');

    await _ref.child(login).set({
      'account': generateBankAccount(login),
      'count': 0,
      'currency': '₽',
    });

    return const Right(null);
  }
}
