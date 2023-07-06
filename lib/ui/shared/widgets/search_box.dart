import 'package:flutter/material.dart';
import 'package:fitsaw/ui/shared/widgets/basic_box.dart';
import 'package:fitsaw/utils/custom_colors.dart';

// TODO: Potential bug where there is still an underline in the textbox

class SearchBox extends StatelessWidget {
  final TextEditingController controller;

  const SearchBox(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return BasicBox(
      TextField(
        controller: controller,
        decoration: const InputDecoration(
            hintText: 'Search...',
            isDense: true,
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: TextStyle(color: CustomColors.dmPrimaryText)),
        style: const TextStyle(color: CustomColors.dmPrimaryText),
      ),
    );
  }
}
