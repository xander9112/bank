import 'package:flutter/material.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({
    required this.currency,
    required this.count,
    required this.account,
    super.key,
    this.onPressed,
  });

  final String account;
  final String currency;
  final int count;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Text(
                currency,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$count $currency'),
                  Text(account),
                ],
              ),
            ),
            if (onPressed != null)
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_upward_rounded),
              ),
          ],
        ),
      ),
    );
  }
}
