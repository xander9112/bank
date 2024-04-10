import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:bank/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthState>(
          create: (context) => AuthState(
            authRepository: AuthRepositoryImpl(
              dataSource: RemoteUserDataSource(),
              tokenDataSource: TokenDataSource(),
            ),
          ),
        ),
        ChangeNotifierProvider<InvoiceState>(
          create: (context) => InvoiceState(
            userRepository: UsersRepositoryImpl(
              tokenDataSource: TokenDataSource(),
              dataSource: RemoteUserDataSource(),
            ),
            repository: InvoicesRepositoryImpl(
              tokenDataSource: TokenDataSource(),
              dataSource: RemoteInvoiceDataSource(),
            ),
          ),
        ),
      ],
      child: const MaterialApp(home: SplashPage()),
    );
  }
}
