import 'package:flutter/services.dart';

class CpfTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newTextLength = newValue.text.length;
    var selectionIndex = newValue.selection.end;

    if (newTextLength > 14) {
      return oldValue;
    }

    var usedSubstringIndex = 0;
    final newText = StringBuffer();

    if (newTextLength >= 4) {
      // ignore: prefer_interpolation_to_compose_strings
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + '.');
      if (newValue.selection.end >= 3) selectionIndex++;
    }
    if (newTextLength >= 7) {
      // ignore: prefer_interpolation_to_compose_strings
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '.');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 10) {
      // ignore: prefer_interpolation_to_compose_strings
      newText.write(newValue.text.substring(6, usedSubstringIndex = 9) + '-');
      if (newValue.selection.end >= 9) selectionIndex++;
    }
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
