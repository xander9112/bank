import 'package:bank/core/_core.dart';
import 'package:bank/features/main/_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AuthState _authState;

  @override
  void initState() {
    super.initState();

    _authState = context.read<AuthState>();

    _authState
      ..addListener(_authListener)
      ..init();
  }

  @override
  void dispose() {
    _authState.removeListener(_authListener);

    super.dispose();
  }

  void _authListener() {
    if (context.read<AuthState>().isAuth) {
      RouterHelper.replace<void>(context, const MainPage());
    } else {
      RouterHelper.replace<void>(context, const AuthPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bank',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
