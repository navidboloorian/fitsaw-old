import 'package:flutter/material.dart';
import 'package:fitsaw/ui/shared/widgets/custom_container.dart';
import 'package:fitsaw/utils/custom_colors.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;

  const SearchBox(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Search...',
        ),
      ),
    );
  }
}
