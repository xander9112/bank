import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

class RemoteTasksDataSource implements TasksDataSource {
  DatabaseReference ref = FirebaseDatabase.instance.ref('tasks');

  @override
  Future<Either<Failure, TaskDTO>> createTask(
    String login,
    String name,
    int price,
  ) async {
    final tasksByLoginRef = ref.child(login).push();

    await tasksByLoginRef.set({
      'name': name,
      'price': price,
      'status': 'created',
      'createAt': DateTime.now().toUtc().toString(),
    });

    return getTask(login, tasksByLoginRef.key!);
  }

  @override
  Future<Either<Failure, List<TaskDTO>>> getTasks(String login) async {
    final snapshot = await ref.child(login).get();

    if (snapshot.exists) {
      final task = _convertToMap(snapshot.value);

      return Right(
        task.keys.map((e) {
          return TaskDTO.fromJson({
            ..._convertToMap(task[e]),
            'id': e,
          });
        }).toList(),
      );
    }

    return Right<Failure, List<TaskDTO>>(List.from([]));
  }

  @override
  Future<Either<Failure, TaskDTO>> getTask(String login, String id) async {
    final snapshot = await ref.child(login).child(id).get();

    if (snapshot.exists) {
      return Right(
        TaskDTO.fromJson({
          ..._convertToMap(snapshot.value),
          'id': id,
        }),
      );
    }

    return Left(TaskFailure(code: 404, message: 'Task not found'));
  }

  @override
  Future<Either<Failure, TaskDTO>> markAsDone(String login, String id) async {
    await ref.child(login).child(id).update({
      'status': TaskStatus.done.name,
    });

    return getTask(login, id);
  }

  @override
  Future<Either<Failure, TaskDTO>> markAsCompleted(
    String login,
    String id,
  ) async {
    await ref.child(login).child(id).update({
      'status': TaskStatus.confirmed.name,
    });

    return getTask(login, id);
  }

  @override
  Future<Either<Failure, TaskDTO>> markAsDeclined(
    String login,
    String id,
    String comment,
  ) async {
    await ref.child(login).child(id).update({
      'status': TaskStatus.declined.name,
      'comment': comment,
    });

    return getTask(login, id);
  }

  Map<String, dynamic> _convertToMap(Object? value) {
    if (value != null) {
      return (value as Map).cast<String, dynamic>();
    }

    return {};
  }

  @override
  Future<Either<Failure, void>> deleteTask(String login, String id) async {
    try {
      await ref.child(login).child(id).remove();

      return const Right(null);
    } catch (error) {
      return Left(TaskFailure(code: 400, message: error.toString()));
    }
  }
}
