import 'package:fitsaw/ui/shared/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/basic_box.dart';
import 'package:fitsaw/ui/shared/widgets/search_box.dart';
import 'package:fitsaw/ui/shared/widgets/expandable_section.dart';

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
    return Text("Exercsies!");
  }
}
