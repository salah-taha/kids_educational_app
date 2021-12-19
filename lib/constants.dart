import 'package:flutter/material.dart';

class Constants {
  // Colors
  static const Color darkBlueColor = Color(0xFF1D3557);
  static const Color darkGreenColor = Color(0xFF457B9D);
  static const Color midGreenColor = Color(0xFFA8DADC);
  static const Color greenColor = Color(0xFFF1FAEE);
  static const Color redColor = Color(0xFFE63946);
  static const Color whiteColor = Color(0xFFFFFFFF);

  // Text Styles
  static const TextStyle largeTitleTextStyle = TextStyle(
    color: redColor,
    fontSize: 52,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleTextStyle = TextStyle(
    color: redColor,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subTitleTextStyle = TextStyle(
    color: redColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // insets
  static const EdgeInsets defaultPadding = EdgeInsets.all(16);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 16);

  static const List<String> arabicLetters = [
    "ا",
    "ب",
    "ت",
    "ث",
    "ج",
    "ح",
    "خ",
    "د",
    "ذ",
    "ر",
    "ز",
    "س",
    "ش",
    "ص",
    "ض",
    "ط",
    "ظ",
    "ع",
    "غ",
    "ف",
    "ق",
    "ك",
    "ل",
    "م",
    "ن",
    "ه",
    "و",
    "ي",
  ];
}
