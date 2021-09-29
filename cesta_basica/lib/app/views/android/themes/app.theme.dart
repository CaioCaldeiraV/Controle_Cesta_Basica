import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );
}
