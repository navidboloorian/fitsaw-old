import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';

class Themes {
  static ThemeData get light {
    return ThemeData(
      primaryColor: CustomColors.lmScreenBackground,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: CustomColors.dmScreenBackground,
    );
  }
}
