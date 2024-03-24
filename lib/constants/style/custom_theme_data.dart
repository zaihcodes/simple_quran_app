import 'package:flutter/material.dart';
import 'package:quran_app/constants/style/colors.dart';
import 'package:quran_app/constants/style/text_styles.dart';

class CustomThemeData {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme(elevation: 0),
    scaffoldBackgroundColor: Colors.white,
    textTheme: kTextTheme.apply(
      bodyColor: kSecondary,
      decorationColor: kSecondary,
      displayColor: kSecondary,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: kColorScheme.copyWith(
      primary: kDarkTheme,
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(elevation: 0),
    scaffoldBackgroundColor: kDarkTheme,
    textTheme: kTextTheme.apply(
      bodyColor: Colors.white,
      decorationColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
