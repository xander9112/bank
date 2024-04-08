import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  String _login = '';

  Future<void> _onPressedSignIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final result = await context.read<AuthState>().signIn(_login);

      result.fold((l) => null, (r) {
        RouterHelper.replace<void>(context, const MainPage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthState _state = context.watch<AuthState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
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
                    labelText: 'Логин',
                  ),
                  validator: Validators.requiredValidator,
                  onSaved: (newValue) {
                    setState(() {
                      _login = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                if (_state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      _state.error?.message ?? 'Unknown error',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () => _onPressedSignIn(context),
                  child: const Text('Войти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
