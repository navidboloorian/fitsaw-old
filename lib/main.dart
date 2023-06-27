import 'package:flutter/material.dart';
import 'package:fitsaw/ui/pages/routines.dart';
import 'package:fitsaw/utils/themes.dart';

void main() async {
  runApp(const App());
}

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Routines(),
      theme: Themes.light,
    );
  }
}
