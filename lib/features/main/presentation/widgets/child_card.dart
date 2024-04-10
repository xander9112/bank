import 'package:bank/core/features/_features.dart';
import 'package:bank/features/_features.dart';
import 'package:bank/features/main/presentation/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({required this.user, super.key});

  final UserDTO user;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksState>(
      create: (context) => TasksState(
        userRepository: UsersRepositoryImpl(
          tokenDataSource: TokenDataSource(),
          dataSource: RemoteUserDataSource(),
        ),
        repository: TasksRepositoryImpl(
          dataSource: RemoteTasksDataSource(),
        ),
      )..init(user.login),
      lazy: false,
      builder: (context, child) {
        final List<TaskDTO> tasks = context.watch<TasksState>().tasks;

        if (user.invoice == null) {
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(user.fullName),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<InvoiceState>().createInvoice(user.login);
                },
                child: const Text('Создать счёт'),
              ),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(user.fullName),
            ),
            InvoiceCard(
              currency: user.invoice!.currency,
              count: user.invoice!.count,
              account: user.invoice!.maskedAccount,
            ),
            if (tasks.isNotEmpty)
              ...tasks.map((task) {
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text('${task.price} ${user.invoice!.currency}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context
                          .read<TasksState>()
                          .deleteTask(user.login, task.id);
                    },
                  ),
                );
              }),
            ElevatedButton(
              onPressed: () {
                _onPressedCreateTask(context);
              },
              child: const Text('Создать задачу'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onPressedCreateTask(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (_) => CreateTaskScreen(
        onPressedCreate: (name, price) async {
          await context.read<TasksState>().createTask(user.login, name, price);

          return context.read<TasksState>().error?.message;
        },
      ),
    );
  }
}
