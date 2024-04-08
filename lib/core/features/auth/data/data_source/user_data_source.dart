import 'package:bank/core/_core.dart';
import 'package:dartz/dartz.dart';

abstract class UserDataSource {
  /// Получить информацию о пользователе
  /// Если пользователя не существует UserFailure(code: 404)
  Future<Either<Failure, UserDTO>> getUser(String login);

  Future<Either<Failure, List<UserDTO>>> getChildren(String login);

  /// Авторизоваться под логином
  /// Если role == UserRole.parent и пользователь
  /// не существует UserFailure(code: 1)
  ///
  /// Если role == UserRole.child и пользователь
  /// не существует UserFailure(code: 2)
  Future<Either<Failure, AuthDTO>> signIn(String login);

  /// Зарегистрировать родителя
  Future<Either<Failure, AuthDTO>> signUpParent({
    required String login,
    required String lastName,
    required String firstName,
  });

  /// Зарегистрировать ребенка
  Future<Either<Failure, AuthDTO>> signUpChild({
    required String login,
    required String lastName,
    required String firstName,
    required String parentLogin,
  });
}
