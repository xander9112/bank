import 'dart:async';

import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({required this.user, super.key});

  final UserDTO user;

  @override
  Widget build(BuildContext context) {
    final InvoiceState invoiceState = context.read<InvoiceState>();
    final List<InvoiceDTO> invoices = context.watch<InvoiceState>().invoices;
    final List<UserDTO> children = context.watch<InvoiceState>().children;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.fullName),
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
                invoiceState.topUp(user.login, 1000);
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
                      ChildCard(parent: user, child: e),
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
