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
        elevation: 0,
        toolbarHeight: 84,
        backgroundColor: CustomColors.lmScreenBackground,

        // navbar logo
        title: const Center(
          child: Image(
            image: AssetImage('assets/images/logo_with_text.png'),
            height: 64,
          ),
        ),
      ),
      body: Text('Exercises'),
      bottomNavigationBar: BottomBar(
        pages: widget.pages,
        currentPage: widget.pages[0],
      ),
    );
  }
}
