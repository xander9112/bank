import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final AuthState authState;
  late final InvoiceState invoiceState;

  @override
  void initState() {
    super.initState();

    authState = context.read<AuthState>();
    invoiceState = context.read<InvoiceState>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // invoiceState.init();+
    });
  }

  @override
  Widget build(BuildContext context) {
    if (authState.user.role.isChild) {
      return ChildScreen(
        user: authState.user,
      );
    }

    return ParentScreen(
      user: authState.user,
    );
  }
}
