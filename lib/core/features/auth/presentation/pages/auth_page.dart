import 'package:bank/core/_core.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                RouterHelper.push(context, const SignUpPage());
              },
              child: const Text('Зарегистрироваться'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                RouterHelper.push(context, const SignInPage());
              },
              child: const Text('Уже есть аккаунт'),
            ),
          ],
        ),
      ),
    );
  }
}
