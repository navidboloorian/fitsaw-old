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
      body: Column(
        children: [
          SearchBox(_searchController),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: widget.dbHelper.items.changes,
            builder: (context, snapshot) {
              List<Widget> widgetList() {
                List<Widget> list = [];

                for (dynamic item in widget.dbHelper.items) {
                  item = item as Exercise;

                  list.add(CustomContainer(Text(item.name)));
                }

                return list;
              }

              return Flexible(
                child: ExpandableSection(
                  "Your Exercises",
                  widgetList(),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        pages: widget.pages,
        currentPage: widget.pages[0],
      ),
      floatingActionButton: GestureDetector(
          onTap: () => widget.dbHelper
              .add(Exercise(ObjectId(), "test 123", false, false)),
          child: Container(color: Colors.blue, child: Icon(Icons.plus_one))),
    );
  }
}
