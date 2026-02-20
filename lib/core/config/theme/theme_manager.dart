import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData getLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      iconTheme: IconThemeData(size: 24),
    );
  }
}
