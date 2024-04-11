import 'dart:async';

import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChildScreen extends StatelessWidget {
  const ChildScreen({required this.user, super.key});

  final UserDTO user;

  @override
  Widget build(BuildContext context) {
    final List<InvoiceDTO> invoices = context.watch<InvoiceState>().invoices;

    return Scaffold(
      appBar: AppBar(
        leading: user.role.isChild
            ? const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(Icons.child_care),
              )
            : null,
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
            return ChildCard(child: user.copyWith(invoice: e));

            // InvoiceCard(
            //   currency: e.currency,
            //   count: e.count,
            //   account: e.maskedAccount,
            //   onPressed: () {
            //     invoiceState.topUp(user.login, 1000);
            //   },
            // );
          }),
        ],
      ),
    );
  }
}
