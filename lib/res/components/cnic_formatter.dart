import 'package:flutter/services.dart';

class CnicInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Allowing only digits
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    // If the length exceeds 14, we limit it
    if (digits.length > 14) {
      digits = digits.substring(0, 14);
    }

    // Formatting the CNIC
    StringBuffer formattedCnic = StringBuffer();

    if (digits.length >= 5) {
      formattedCnic.write(digits.substring(0, 5));
      if (digits.length >= 6) {
        formattedCnic.write('-');
        formattedCnic.write(digits.substring(5, 12));
        if (digits.length >= 13) {
          formattedCnic.write('-');
          formattedCnic.write(digits.substring(12, 13));
        }
      }
    } else {
      formattedCnic.write(digits);
    }

    return TextEditingValue(
      text: formattedCnic.toString(),
      selection: TextSelection.collapsed(offset: formattedCnic.length),
    );
  }
}
