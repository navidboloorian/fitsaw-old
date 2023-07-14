/// Class used to create custom expandable section widget. Takes a title to
/// display on the title block and a list of elements to display in the section.
/// Custom expandable is necessary in order to change the color of the header vs
/// the list elements.

import 'dart:math';

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
  double titlePadding = 30;
  int itemCount = 0;

  // default state is arrow pointing to the right (collapsed)
  double turns = 3 / 4;

  void toggleExpandable() {
    setState(
      () {
        if (expanded) {
          itemCount = 0;
          turns = 3 / 4;
        } else {
          // setting listHeight to null makes it expand to fit all children
          itemCount = widget.children.length + 1;
          turns = 0;
        }

        expanded = !expanded;
      },
    );
  }

  /// Ensures that the number of items displayed are synced with the number of
  /// items in the list. Previously, when a new item was added the list count
  /// wouldn't update if the list was already expanded.
  void resetItemCount() {
    if (expanded && widget.children.length != itemCount) {
      itemCount = widget.children.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    resetItemCount();

    return Column(
      children: [
        // title block that collapses/expands the list on tap
        GestureDetector(
          onTap: toggleExpandable,
          child:
              // sets title background color
              Container(
            decoration: const BoxDecoration(
              color: CustomColors.dmSecondaryBlockBackground,
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
                SizedBox(width: titlePadding),
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
                SizedBox(width: titlePadding),
              ],
            ),
          ),
        ),
        AnimatedSize(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 150),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // add 1 to length to account for separator after title
            itemCount: itemCount,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10),
            itemBuilder: (context, index) {
              // separator right after the title
              if (index == 0) return const SizedBox.shrink();

              return Container(child: widget.children[index - 1]);
            },
          ),
        ),
      ],
    );
  }
}
