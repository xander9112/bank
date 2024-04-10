import 'package:bank/core/utils/failure.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';

abstract interface class InvoicesRepository {
  Future<Either<Failure, InvoiceDTO>> createInvoice(String login);

  Future<Either<Failure, List<InvoiceDTO>>> getInvoices();

  Future<Either<Failure, InvoiceDTO>> getInvoice(String login);

  Future<Either<Failure, InvoiceDTO>> topUp(String account, int count);
}
