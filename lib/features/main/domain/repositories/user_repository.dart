import 'package:bank/core/features/_features.dart';
import 'package:bank/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

// ignore: one_member_abstracts
abstract interface class UserRepository {
  Future<Either<Failure, List<UserDTO>>> getChildren();
}
