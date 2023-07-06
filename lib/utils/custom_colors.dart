import 'package:flutter/material.dart';

abstract class CustomColors {
  static const Color fitsawGreen = Color(0xff61bb46);
  static const Color fitsawBlue = Color(0xff009ddc);
  static const Color fitsawPurple = Color(0xff963d97);
  static const Color fitsawRed = Color(0xffe03A3e);
  static const Color fitsawOrange = Color(0xfff5821f);

  // light mode
  static const Color lmScreenBackground = Colors.white;
  static const Color lmPrimaryBlockBackground = Colors.white;
  static const Color lmSecondaryBlockBackground = Color(0xff939594);
  static const Color lmPrimaryText = Colors.black;

  // dark mode
  static const Color dmScreenBackground = Color(0xff0d1117);
  static const Color dmPrimaryBlockBackground = Color(0xff23242a);
  static const Color dmSecondaryBlockBackground = Color(0xff373842);
  static const Color dmPrimaryText = Color(0xffe3e3e3);
  static const Color dmSecondaryText = Color(0xff8c8c8c);
}
