import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final int maxLength;

  PhoneNumberFormatter({this.maxLength = 10});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    final limited = digitsOnly.length > maxLength
        ? digitsOnly.substring(0, maxLength)
        : digitsOnly;

    return TextEditingValue(
      text: limited,
      selection: TextSelection.collapsed(offset: limited.length),
    );
  }
}
