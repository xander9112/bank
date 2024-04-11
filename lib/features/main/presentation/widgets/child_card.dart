import 'package:bank/core/features/_features.dart';
import 'package:bank/features/_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({required this.child, this.parent, super.key});

  final UserDTO? parent;
  final UserDTO child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksState>(
      create: (context) => TasksState(
        repository: TasksRepositoryImpl(
          dataSource: RemoteTasksDataSource(),
        ),
      )..init(child.login),
      lazy: false,
      builder: (context, _) {
        final List<TaskDTO> tasks = context.watch<TasksState>().tasks;

        if (child.invoice == null) {
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(child.fullName),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<InvoiceState>().createInvoice(child.login);
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
              child: Text(child.fullName),
            ),
            InvoiceCard(
              currency: child.invoice!.currency,
              count: child.invoice!.count,
              account: child.invoice!.maskedAccount,
            ),
            if (tasks.isNotEmpty)
              ...tasks.map((task) {
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text('${task.price} ${child.invoice!.currency}'),
                  trailing: parent != null
                      ? IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<TasksState>()
                                .deleteTask(child.login, task.id);
                          },
                        )
                      : null,
                );
              }),
            if (parent != null)
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
          await context.read<TasksState>().createTask(child.login, name, price);

          return context.read<TasksState>().error?.message;
        },
      ),
    );
  }
}
