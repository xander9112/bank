import 'package:bank/core/utils/failure.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';

abstract interface class TasksRepository {
  Future<Either<Failure, TaskDTO>> createTask(
    String login,
    String name,
    int price,
  );

  Future<Either<Failure, List<TaskDTO>>> getTasks(String login);

  Future<Either<Failure, TaskDTO>> getTask(String login, String id);

  Future<Either<Failure, void>> deleteTask(String login, String id);

  Future<Either<Failure, TaskDTO>> markAsDone(String login, String id);

  Future<Either<Failure, TaskDTO>> markAsCompleted(String login, String id);

  Future<Either<Failure, TaskDTO>> markAsDeclined(
    String login,
    String id,
    String comment,
  );
}
