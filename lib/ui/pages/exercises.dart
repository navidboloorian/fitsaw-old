import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';
import 'package:fitsaw/db/models/models.dart';
import 'package:fitsaw/db/database_helper.dart';
import 'package:realm/realm.dart';

class Exercises extends ConsumerStatefulWidget {
  final List<String> pages;
  final DatabaseHelper dbHelper;

  const Exercises({super.key, required this.pages, required this.dbHelper});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExercisesState();
}

class _ExercisesState extends ConsumerState<Exercises> {
  final TextEditingController _searchController = TextEditingController();

  List<Widget> widgetList() {
    List<Widget> list = [];

    for (dynamic item in widget.dbHelper.items) {
      item = item as Exercise;

      // try using this key to make things better on streambuilder TODO
      list.add(CustomContainer(key: ValueKey(item.id), Text(item.name)));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // navbar logo
        title: const Image(
          image: AssetImage('assets/images/logo.png'),
          height: 56,
        ),
        actions: [
          PlusButton(() => Navigator.pushNamed(context, 'view_exercise'))
        ],
      ),
      body: StreamBuilder(
        stream: widget.dbHelper.items.changes,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CustomContainer(Text('loading'));
          }

          return ListView(
            children: [
              SearchBox(_searchController),
              const SizedBox(
                height: 10,
              ),
              ExpandableSection(
                "Your Exercises",
                widgetList(),
              ),
              const SizedBox(height: 10),
              const ExpandableSection(
                "Downloaded Exercises",
                [
                  CustomContainer(
                    Text(
                      "testing",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomBar(
        pages: widget.pages,
        currentPage: widget.pages[0],
      ),
    );
  }
}
