import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:flutter/widgets.dart';

class TasksState extends ChangeNotifier {
  TasksState({
    required TasksRepository repository,
    required UsersRepository userRepository,
  })  : _repository = repository,
        _userRepository = userRepository;

  List<TaskDTO> tasks = [];
  List<UserDTO> children = [];

  final TasksRepository _repository;
  final UsersRepository _userRepository;

  Failure? error;

  Future<void> init(String login) async {
    print('INIT');
    final result = await _repository.getTasks(login);

    result.fold((l) {
      error = l;
    }, (r) {
      tasks = r;
    });

    notifyListeners();
  }

  Future<void> createTask(String login, String name, int price) async {
    final result = await _repository.createTask(login, name, price);

    result.fold((l) {
      error = l;
    }, (r) {
      tasks.add(r);
    });

    notifyListeners();
  }

  Future<void> deleteTask(String login, String id) async {
    final result = await _repository.deleteTask(login, id);

    result.fold((l) {
      error = l;
    }, (r) {
      tasks = tasks.where((element) => element.id != id).toList();
    });

    notifyListeners();
  }

  void clear() {
    tasks = [];
    children = [];
  }
}
