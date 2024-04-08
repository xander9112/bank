import 'package:bank/core/_core.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserDTO>> checkIsAuth();

  Future<Either<Failure, UserDTO>> getUser(String login);

  Future<Either<Failure, UserDTO>> signIn(String login);

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, UserDTO>> signUpParent({
    required String login,
    required String lastName,
    required String firstName,
  });

  Future<Either<Failure, UserDTO>> signUpChild({
    required String login,
    required String lastName,
    required String firstName,
    required String parentLogin,
  });
}
