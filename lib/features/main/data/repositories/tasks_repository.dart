import 'package:bank/core/utils/failure.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';

class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl({required TasksDataSource dataSource})
      : _dataSource = dataSource;

  final TasksDataSource _dataSource;

  @override
  Future<Either<Failure, TaskDTO>> createTask(
    String login,
    String name,
    int price,
  ) async {
    return _dataSource.createTask(login, name, price);
  }

  @override
  Future<Either<Failure, List<TaskDTO>>> getTasks(String login) async {
    return _dataSource.getTasks(login);
  }

  @override
  Future<Either<Failure, TaskDTO>> getTask(String login, String id) async {
    return _dataSource.getTask(login, id);
  }

  @override
  Future<Either<Failure, void>> deleteTask(String login, String id) async {
    return _dataSource.deleteTask(login, id);
  }

  @override
  Future<Either<Failure, TaskDTO>> markAsDone(String login, String id) async {
    return _dataSource.markAsDone(login, id);
  }

  @override
  Future<Either<Failure, TaskDTO>> markAsCompleted(
    String login,
    String id,
  ) async {
    return _dataSource.markAsCompleted(login, id);
  }

  @override
  Future<Either<Failure, TaskDTO>> markAsDeclined(
    String login,
    String id,
    String comment,
  ) async {
    return _dataSource.markAsDeclined(login, id, comment);
  }
}
