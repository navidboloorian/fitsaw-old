import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';

class Themes {
  static ThemeData get light {
    return ThemeData(
      primaryColor: CustomColors.lmScreenBackground,
      fontFamily: 'OpenSans',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: CustomColors.dmScreenBackground,
    );
  }
}
