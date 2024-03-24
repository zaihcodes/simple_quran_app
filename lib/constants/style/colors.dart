import 'package:flutter/material.dart';

// Purbel

const Color kPrimary = Color.fromRGBO(134, 62, 213, 1.0); //#863ED5
const Color kSecondary = Color.fromRGBO(103, 44, 188, 1.0); //#672CBC
const Color kDark = Color.fromRGBO(59, 30, 119, 1.0); //#3B1E77
const Color kBlack = Color.fromRGBO(36, 15, 79, 1.0); //#240F4F
const Color kGrey = Color.fromRGBO(135, 137, 163, 1.0); //#8789A3
const Color kGrey92 = Color.fromRGBO(235, 235, 235, 1.0); //#ebebeb
const Color kGreyLight = Color.fromRGBO(171, 175, 215, 1.0); //#abafd7
const Color kMikadoYellow = Color.fromRGBO(249, 176, 145, 1.0); //#F9B091
const Color kLinear1 = Color.fromRGBO(223, 152, 250, 1.0);
const Color kLinear2 = Color.fromRGBO(144, 85, 255, 1.0);
const Color kDarkTheme = Color.fromRGBO(9, 25, 69, 1.0); //#152451

const kColorScheme = ColorScheme(
  primary: kPrimary,
  primaryContainer: kPrimary,
  secondary: kSecondary,
  secondaryContainer: kSecondary,
  surface: kPrimary,
  background: kPrimary,
  error: Colors.red,
  onPrimary: kDark,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
