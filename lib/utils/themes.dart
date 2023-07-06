import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';

class Themes {
  static ThemeData get light {
    return ThemeData(
      primaryColor: CustomColors.lmScreenBackground,
      canvasColor: CustomColors.lmScreenBackground,
      fontFamily: 'OpenSans',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.lmScreenBackground,
        foregroundColor: CustomColors.lmPrimaryText,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 84,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: CustomColors.dmScreenBackground,
      canvasColor: CustomColors.dmScreenBackground,
      fontFamily: 'OpenSans',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: CustomColors.dmPrimaryText),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.dmScreenBackground,
        foregroundColor: CustomColors.dmPrimaryText,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 56,
      ),
    );
  }
}
