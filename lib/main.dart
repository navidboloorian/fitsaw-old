import 'package:fitsaw/db/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/pages/pages.dart';
import 'package:fitsaw/utils/themes.dart';
import 'package:fitsaw/db/models/models.dart';
import 'package:realm/realm.dart';

void main() async {
  Realm realm = Realm(Configuration.local([Exercise.schema]));

  // stores all the collections in the realm
  Map<String, RealmResults> collections = {};

  collections['exercises'] = realm.all<Exercise>();

  runApp(ProviderScope(child: App(collections)));
}

/// The Widget that configures your application.
class App extends ConsumerWidget {
  Map<String, RealmResults> collections;

  App(
    this.collections, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // list of all navigable pages
    // pass these to other widgets to avoid mistakes on lower levels
    const List<String> pages = <String>['exercises', 'routines', 'market'];

    return MaterialApp(
      onGenerateRoute: (route) {
        // allows for access of routes by name
        // not using the route field of MaterialApp so the default animation can be removed

        if (route.name == 'exercises') {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => Exercises(
              pages: pages,
              dbHelper: DatabaseHelper<Exercise>(
                collections['exercises'] as RealmResults<Exercise>,
              ),
            ),
          );
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
            builder: (context) => ViewExercise(
              dbHelper: DatabaseHelper<Exercise>(
                collections['exercises'] as RealmResults<Exercise>,
              ),
            ),
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
