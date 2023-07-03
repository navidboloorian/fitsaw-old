/// Class used to create custom expandable section widget. Takes a title to
/// display on the title block and a list of elements to display in the section.
/// Custom expandable is necessary in order to change the color of the header vs
/// the list elements.

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

  // default state is arrow pointing to the right (collapsed)
  double turns = 3 / 4;

  void toggleExpandable() {
    setState(() {
      if (expanded) {
        listHeight = 0;
        turns = 3 / 4;
      } else {
        // setting listHeight to null makes it expand to fit all children
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
        // title block that collapses/expands the list on tap
        GestureDetector(
          onTap: toggleExpandable,
          child:
              // sets background color
              Container(
            decoration: const BoxDecoration(
              color: CustomColors.lmSecondaryBlockBackground,
              border: Border(
                top: BorderSide(color: Colors.black, width: 1),
                bottom: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            constraints: const BoxConstraints(minHeight: 40),
            child:
                // content of the title block
                Row(
              children: [
                // used for padding
                const SizedBox(width: 35),
                // text that is displayed on the block
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // arrow next to the text
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 50),
                  child: const Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                // used for padding
                const SizedBox(width: 35),
              ],
            ),
          ),
        ),
        // use AnimatedSize to animate when list expands
        AnimatedSize(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 150),
          child: SizedBox(
            height: listHeight,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }
}
