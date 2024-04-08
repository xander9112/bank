import 'package:bank/core/_core.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required UserDataSource dataSource,
    required TokenDataSource tokenDataSource,
  })  : _dataSource = dataSource,
        _tokenDataSource = tokenDataSource;

  final UserDataSource _dataSource;

  final TokenDataSource _tokenDataSource;

  @override
  Future<Either<Failure, UserDTO>> checkIsAuth() async {
    final _token = await _tokenDataSource.getToken();

    if (_token == null) {
      return Future.delayed(
        const Duration(milliseconds: 300),
        () => Left(UserFailure(code: 401)),
      );
    }

    final user = await getUser(_token);

    return user.fold(
      (l) {
        if (l.code == 404) {
          _tokenDataSource.deleteToken();

          return Left(l);
        }

        return Left(l);
      },
      Right.new,
    );
  }

  @override
  Future<Either<Failure, UserDTO>> getUser(String login) async {
    return _dataSource.getUser(login);
  }

  @override
  Future<Either<Failure, UserDTO>> signIn(String login) async {
    final result = await _dataSource.signIn(login);

    return result.fold(Left.new, (response) async {
      await _tokenDataSource.setToken(response.token);

      return Right(response.user);
    });
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    await _tokenDataSource.deleteToken();

    return const Right(null);
  }

  @override
  Future<Either<Failure, UserDTO>> signUpParent({
    required String login,
    required String lastName,
    required String firstName,
  }) async {
    final result = await _dataSource.signUpParent(
      login: login,
      lastName: lastName,
      firstName: firstName,
    );

    return result.fold(Left.new, (response) async {
      await _tokenDataSource.setToken(response.token);

      return Right(response.user);
    });
  }

  @override
  Future<Either<Failure, UserDTO>> signUpChild({
    required String login,
    required String lastName,
    required String firstName,
    required String parentLogin,
  }) async {
    final result = await _dataSource.signUpChild(
      login: login,
      lastName: lastName,
      firstName: firstName,
      parentLogin: parentLogin,
    );

    return result.fold(Left.new, (response) async {
      await _tokenDataSource.setToken(response.token);

      return Right(response.user);
    });
  }
}
