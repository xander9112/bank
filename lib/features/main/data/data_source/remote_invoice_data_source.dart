import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

class RemoteInvoiceDataSource implements InvoiceDataSource {
  DatabaseReference ref = FirebaseDatabase.instance.ref('invoices');

  @override
  Future<Either<Failure, InvoiceDTO>> getInvoice(String login) async {
    final myInvoice = await ref.child(login).get();

    if (myInvoice.exists) {
      return Right(
        InvoiceDTO.fromJson(_convertToMap(myInvoice.value)),
      );
    }

    return Left(InvoiceFailure(code: 404, message: 'Invoice not found'));
  }

  @override
  Future<Either<Failure, List<InvoiceDTO>>> getInvoices(String login) async {
    final myInvoice = await ref.child(login).get();

    if (myInvoice.exists) {
      return Right(
        [InvoiceDTO.fromJson(_convertToMap(myInvoice.value))],
      );
    }

    return Left(InvoiceFailure(code: 404, message: 'Invoice not found'));
  }

  @override
  Future<Either<Failure, InvoiceDTO>> topUp(String login, int count) async {
    final result = await getInvoice(login);

    return result.fold(Left.new, (r) async {
      await ref.child(login).update({
        'count': r.count + count,
      });

      return getInvoice(login);
    });
  }

  Map<String, dynamic> _convertToMap(Object? value) {
    if (value != null) {
      return (value as Map).cast<String, dynamic>();
    }

    return {};
  }

  @override
  Future<Either<Failure, InvoiceDTO>> createInvoice(
    String login,
    String parentLogin,
  ) async {
    await ref.child(login).set({
      'account': generateBankAccount(login),
      'count': 0,
      'currency': '₽',
      'parentLogin': parentLogin,
    });

    return getInvoice(login);
  }
}
