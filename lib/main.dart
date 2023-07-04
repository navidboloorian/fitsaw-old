import 'package:flutter/material.dart';
import 'package:fitsaw/ui/pages/pages.dart';
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
    // list of all navigable pages
    // pass these to other widgets to avoid mistakes on lower levels
    const List<String> pages = <String>['exercises', 'routines', 'market'];

    return MaterialApp(
      onGenerateRoute: (route) {
        // allows for access of routes by name
        // not using the route field of MaterialApp so the default animation can be removed

        // exercises
        if (route.name == pages[0]) {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const Exercises(pages: pages));
        }

        // routines
        if (route.name == pages[1]) {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const Routines(pages: pages));
        }

        // market
        if (route.name == pages[2]) {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const Market(pages: pages));
        }

        return null;
      },
      home: const Routines(pages: pages),
      theme: Themes.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
