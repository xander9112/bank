import 'package:flutter/material.dart';

abstract class RouterHelper {
  static Future<T?> push<T extends Object?>(
    BuildContext context,
    Widget route,
  ) {
    return Navigator.of(context).push(
      MaterialPageRoute<T>(builder: (context) => route),
    );
  }

  static void pop<T extends Object?>(
    BuildContext context, [
    T? result,
  ]) {
    return Navigator.of(context).pop(result);
  }

  static Future<T?> replace<T extends Object?>(
    BuildContext context,
    Widget route,
  ) {
    Navigator.of(context).popUntil((route) => route.isFirst);

    return Navigator.of(context).pushReplacement(
      MaterialPageRoute<T>(builder: (context) => route),
    );
  }
}
