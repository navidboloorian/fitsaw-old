import 'package:fitsaw/ui/shared/classes/page_arguments.dart';
import 'package:fitsaw/ui/shared/widgets/tagged_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';
import 'package:fitsaw/utils/custom_colors.dart';
import 'package:fitsaw/db/models/models.dart';
import 'package:fitsaw/db/database_helper.dart';

class Exercises extends ConsumerStatefulWidget {
  final List<String> pages;
  final DatabaseHelper dbHelper;

  const Exercises({super.key, required this.pages, required this.dbHelper});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExercisesState();
}

class _ExercisesState extends ConsumerState<Exercises> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_setSearchQuery);
  }

  void _setSearchQuery() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  List<Widget> widgetList() {
    List<Widget> list = [];

    for (dynamic item in widget.dbHelper.items) {
      item = item as Exercise;

      bool containsSearchQuery = false;

      if (item.name.toLowerCase().contains(_searchQuery)) {
        containsSearchQuery = true;
      }

      if (!containsSearchQuery) {
        for (String tag in item.tags) {
          if (tag.toLowerCase().contains(_searchQuery)) {
            containsSearchQuery = true;

            break;
          }
        }
      }

      if (containsSearchQuery) {
        list.add(
          Center(
            child: Dismissible(
              key: ValueKey(item.id),
              background: Container(
                color: CustomColors.fitsawRed,
                child: const Center(
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: CustomColors.dmScreenBackground,
                  ),
                ),
              ),
              onDismissed: (DismissDirection direction) =>
                  widget.dbHelper.delete(item),
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * .05),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context,
                        arguments: PageArguments(isNew: false, exercise: item),
                        'view_exercise'),
                    child: CustomContainer(item.tags.isEmpty
                        ? Text(item.name)
                        : TaggedWrapper(
                            tags: item.tags, child: Text(item.name))),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .05),
                ],
              ),
            ),
          ),
        );
      }
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
          PlusButton(
            () => Navigator.pushNamed(
              context,
              arguments: PageArguments(isNew: true),
              'view_exercise',
            ),
          )
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
              Center(child: SearchBox(_searchController)),
              const SizedBox(height: 10),
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
