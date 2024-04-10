import 'package:bank/core/_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key, this.onPressedCreate});

  final Future<String?> Function(String name, int price)? onPressedCreate;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late int _price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новая задача'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Название задачи',
                  ),
                  validator: (value) {
                    final required = Validators.requiredValidator(value);

                    if (required != null) {
                      return required;
                    }

                    return Validators.maxLength(value!, 256);
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _name = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Цена',
                  ),
                  validator: Validators.requiredValidator,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSaved: (newValue) {
                    setState(() {
                      _price = int.tryParse(newValue!) ?? 0;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () => _onPressedCreate(context),
                  child: const Text('Создать'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressedCreate(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (widget.onPressedCreate != null) {
        final String? error = await widget.onPressedCreate!(_name, _price);

        if (error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                error,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          );
        } else {
          RouterHelper.pop(context);
        }
      }
    }
  }
}
