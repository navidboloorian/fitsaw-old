import 'package:fitsaw/screens/routines.dart';
import 'package:flutter/material.dart';

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Routines(),
    );
  }
}