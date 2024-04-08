import 'package:bank/core/_core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  AuthState({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Failure? error;

  UserDTO user = UserDTO.empty();

  bool get isAuth => user.login != 'test';

  Future<void> init() async {
    final result = await _authRepository.checkIsAuth();

    result.fold((l) {}, (r) {
      user = r;
    });

    notifyListeners();
  }

  Future<Either<Failure, UserDTO>> signIn(String login) async {
    error = null;

    notifyListeners();

    final result = await _authRepository.signIn(login);

    return result.fold((l) {
      error = l;

      notifyListeners();

      return Left(l);
    }, (r) {
      user = r;

      notifyListeners();

      return Right(r);
    });
  }

  Future<Either<Failure, UserDTO>> signUp(
    UserRole role,
    String login,
    String lastName,
    String firstName,
    String? parentLogin,
  ) async {
    error = null;

    notifyListeners();

    if (role.isParent) {
      final result = await _authRepository.signUpParent(
        login: login,
        lastName: lastName,
        firstName: firstName,
      );

      return result.fold((l) {
        error = l;

        notifyListeners();

        return Left(l);
      }, (r) {
        user = r;

        notifyListeners();

        return Right(r);
      });
    }

    final result = await _authRepository.signUpChild(
      login: login,
      lastName: lastName,
      firstName: firstName,
      parentLogin: parentLogin!,
    );

    return result.fold((l) {
      error = l;

      notifyListeners();

      return Left(l);
    }, (r) {
      user = r;

      notifyListeners();

      return Right(r);
    });
  }

  Future<void> signOut() async {
    await _authRepository.signOut();

    error = null;
    user = UserDTO.empty();

    notifyListeners();
  }
}

  // Future<Either<Failure, UserDTO>> signUp(String login) async {}
