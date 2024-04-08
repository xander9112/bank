import 'dart:math';

String generateBankAccount(String login) {
  final random = Random();

  final _loginNumbers = login.split('').map(_getIndexFromAlphabet).join();

  final _accountNumber =
      List.generate(16 - _loginNumbers.length, (_) => random.nextInt(10))
          .join();

  return '$_loginNumbers$_accountNumber';
}

int _getIndexFromAlphabet(String letter) {
  // Переводим строку в нижний регистр для унификации
  final String value = letter.toLowerCase();
  // Получаем код ASCII для символа
  final int charCode = value.codeUnitAt(0);
  // Возвращаем индекс буквы в алфавите (0 для 'a', 1 для 'b' и так далее)
  return charCode - 97;
}
