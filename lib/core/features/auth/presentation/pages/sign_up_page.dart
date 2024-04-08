import 'package:bank/core/_core.dart';
import 'package:bank/features/main/_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  bool isReady = false;

  late UserRole _userRole;
  late String _login;
  late String _lastName;
  late String _firstName;

  String? _parentLogin;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectRole();
    });
  }

  Future<void> _selectRole() async {
    final result = await showDialog<UserRole>(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (context) => const SelectRoleScreen(),
    );

    setState(() {
      if (result != null) {
        _userRole = result;
      }

      isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthState _state = context.watch<AuthState>();

    if (!isReady) {
      return const Scaffold();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
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
                  validator: (value) {
                    final required = Validators.requiredValidator(value);

                    if (required != null) {
                      return required;
                    }

                    return Validators.maxLength(value!, 16);
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _login = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Фамилия',
                  ),
                  validator: Validators.requiredValidator,
                  onSaved: (newValue) {
                    setState(() {
                      _lastName = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Имя',
                  ),
                  validator: Validators.requiredValidator,
                  onSaved: (newValue) {
                    setState(() {
                      _firstName = newValue!;
                    });
                  },
                ),
                if (_userRole.isChild)
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Логин родителя',
                    ),
                    validator: Validators.requiredValidator,
                    onSaved: (newValue) {
                      setState(() {
                        _parentLogin = newValue;
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
                  onPressed: () => _onPressedSignUp(context),
                  child: const Text('Зарегистрироваться'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressedSignUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final result = await context.read<AuthState>().signUp(
            _userRole,
            _login,
            _lastName,
            _firstName,
            _parentLogin,
          );

      result.fold((l) => null, (r) {
        RouterHelper.replace<void>(context, const MainPage());
      });
    }
  }
}
