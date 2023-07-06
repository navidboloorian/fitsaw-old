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

        if (route.name == 'exercises') {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const Exercises(pages: pages));
        }

        if (route.name == 'routines') {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const Routines(pages: pages));
        }

        if (route.name == 'market') {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const Market(pages: pages));
        }

        if (route.name == 'view_exercise') {
          return MaterialPageRoute(
            builder: (context) => const ViewExercise(),
          );
        }

        return null;
      },
      home: const Routines(pages: pages),
      theme: Themes.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
