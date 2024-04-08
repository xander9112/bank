// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bank/core/utils/_utils.dart';

class InvoiceFailure implements Failure {
  InvoiceFailure({
    required this.code,
    this.message,
  });

  @override
  final int code;

  @override
  final String? message;

  bool get notFound => code == 404;

  bool get unAuthorized => code == 401;

  @override
  String toString() => 'InvoiceFailure(code: $code, message: $message)';
}
