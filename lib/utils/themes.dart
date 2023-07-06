import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';

class Themes {
  static ThemeData get dark {
    return ThemeData(
      primaryColor: CustomColors.dmScreenBackground,
      canvasColor: CustomColors.dmScreenBackground,
      fontFamily: 'OpenSans',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: CustomColors.dmPrimaryText),

        // applies to TextFields
        titleMedium: TextStyle(color: CustomColors.dmPrimaryText),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.dmScreenBackground,
        foregroundColor: CustomColors.dmPrimaryText,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 56,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: CustomColors.dmSecondaryText),
        isDense: true,
        contentPadding: EdgeInsets.all(0),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
