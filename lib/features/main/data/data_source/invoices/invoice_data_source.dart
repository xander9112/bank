import 'package:bank/core/utils/failure.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';

abstract interface class InvoiceDataSource {
  Future<Either<Failure, List<InvoiceDTO>>> getInvoices(String login);

  Future<Either<Failure, InvoiceDTO>> createInvoice(
    String login,
    String parentLogin,
  );

  Future<Either<Failure, InvoiceDTO>> getInvoice(String login);

  Future<Either<Failure, InvoiceDTO>> topUp(String login, int count);
}
