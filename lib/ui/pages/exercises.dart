import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';

import 'package:fitsaw/utils/custom_colors.dart';

class Exercises extends ConsumerStatefulWidget {
  final List<String> pages;

  const Exercises({super.key, required this.pages});

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
          Expanded(
            child: Container(
              constraints: const BoxConstraints.expand(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        pages: widget.pages,
        currentPage: widget.pages[0],
      ),
    );
  }
}
