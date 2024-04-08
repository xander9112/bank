import 'package:bank/core/_core.dart';
import 'package:flutter/material.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Выберите роль:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    RouterHelper.pop(context, UserRole.child);
                  },
                  child: Text(UserRole.child.name),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    RouterHelper.pop(context, UserRole.parent);
                  },
                  child: Text(UserRole.parent.name),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
