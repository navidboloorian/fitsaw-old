import 'package:fitsaw/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const ExpandableSection(this.title, this.children, {super.key});

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool expanded = false;
  double? listHeight = 0;
  double turns = 3 / 4;

  void toggleExpandable() {
    setState(() {
      if (expanded) {
        listHeight = 0;
        turns = 3 / 4;
      } else {
        listHeight = null;
        turns = 0;
      }

      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleExpandable,
          child: Container(
            decoration: const BoxDecoration(
              color: CustomColors.lmSecondaryBlockBackground,
              border: Border(
                top: BorderSide(color: Colors.black, width: 1),
                bottom: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            constraints: const BoxConstraints(minHeight: 40),
            child: Row(
              children: [
                const SizedBox(width: 25),
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 50),
                  child: const Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedSize(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 150),
          child: SizedBox(
            height: listHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.children,
            ),
          ),
        )
      ],
    );
  }
}
