import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

class InvoiceState extends ChangeNotifier {
  InvoiceState({
    required InvoiceRepository repository,
    required UserRepository userRepository,
  })  : _repository = repository,
        _userRepository = userRepository;

  List<InvoiceDTO> invoices = [];
  List<UserDTO> children = [];

  final InvoiceRepository _repository;
  final UserRepository _userRepository;

  Failure? error;

  Future<void> init() async {
    final result = await _repository.getInvoices();

    result.fold((l) {
      error = l;
    }, (r) {
      invoices = r;
    });

    notifyListeners();

    await _getChildren();
  }

  Future<void> _getChildren() async {
    final result = await _userRepository.getChildren();

    await result.fold((l) {
      error = l;
    }, (r) async {
      children = await Future.wait(
        r.map((e) async {
          UserDTO _user = e.copyWith();

          final result = await _repository.getInvoice(e.login);

          result.fold(Left.new, (r) {
            _user = _user.copyWith(invoice: r);
          });

          return _user;
        }).toList(),
      );
    });

    notifyListeners();
  }

  Future<void> topUp(String account, int count) async {
    final result = await _repository.topUp(account, count);

    result.fold((l) {
      error = l;
    }, (r) {
      invoices = invoices.map((e) {
        if (e.account == r.account) {
          return e.copyWith(count: r.count);
        }

        return e;
      }).toList();
    });

    notifyListeners();
  }

  Future<void> createInvoice(String login) async {
    final result = await _repository.createInvoice(login);

    result.fold((l) {
      error = l;
    }, (r) {
      children = children.map((e) {
        if (e.login == login) {
          return e.copyWith(invoice: r);
        }

        return e;
      }).toList();
    });

    notifyListeners();
  }

  void clear() {
    invoices = [];
    children = [];
  }
}
