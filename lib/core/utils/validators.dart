abstract class Validators {
  static String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
    }

    return null;
  }

  static String? maxLength(String value, int maxLength) {
    if (value.length > maxLength) {
      return 'Количество символов не может превышать $maxLength';
    }

    return null;
  }
}
