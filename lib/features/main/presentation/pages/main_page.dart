import 'dart:async';

import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:bank/features/main/presentation/widgets/_widgets.dart';
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
    final List<InvoiceDTO> invoices = context.watch<InvoiceState>().invoices;
    final List<UserDTO> children = context.watch<InvoiceState>().children;

    return Scaffold(
      appBar: AppBar(
        leading: authState.user.role.isChild
            ? const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(Icons.child_care),
              )
            : null,
        title: Text(authState.user.fullName),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<AuthState>().signOut();
              context.read<InvoiceState>().clear();

              unawaited(
                RouterHelper.replace<void>(context, const SplashPage()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (invoices.isEmpty) const Text('Нет счетов'),
          ...invoices.map((e) {
            return InvoiceCard(
              currency: e.currency,
              count: e.count,
              account: e.maskedAccount,
              onPressed: () {
                invoiceState.topUp(authState.user.login, 1000);
              },
            );
          }),
          if (children.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Дети',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                ...children.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChildCard(user: e),
                    ],
                  );
                }),
              ],
            ),
        ],
      ),
    );
  }
}
