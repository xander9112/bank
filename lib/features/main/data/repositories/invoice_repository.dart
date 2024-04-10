import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';

class InvoicesRepositoryImpl implements InvoicesRepository {
  InvoicesRepositoryImpl({
    required TokenDataSource tokenDataSource,
    required InvoiceDataSource dataSource,
  })  : _tokenDataSource = tokenDataSource,
        _dataSource = dataSource;

  final TokenDataSource _tokenDataSource;
  final InvoiceDataSource _dataSource;

  Future<String> get _token async => (await _tokenDataSource.getToken()) ?? '';

  @override
  Future<Either<Failure, List<InvoiceDTO>>> getInvoices() async {
    return _dataSource.getInvoices(await _token);
  }

  @override
  Future<Either<Failure, InvoiceDTO>> createInvoice(String login) async {
    return _dataSource.createInvoice(login, await _token);
  }

  @override
  Future<Either<Failure, InvoiceDTO>> getInvoice(String login) {
    return _dataSource.getInvoice(login);
  }

  @override
  Future<Either<Failure, InvoiceDTO>> topUp(String account, int count) async {
    return _dataSource.topUp(account, count);
  }
}
