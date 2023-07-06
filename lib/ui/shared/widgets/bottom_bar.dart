import 'package:fitsaw/ui/shared/icons/fitsaw_icons.dart';
import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';

class BottomBar extends StatefulWidget {
  final List<String> pages;
  final String currentPage; // used to highlight the tab

  const BottomBar({super.key, required this.pages, required this.currentPage});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    // map names to images
    const Map<String, Map> icons = <String, Map>{
      'exercises': {
        'icon': FitsawIcons.exercises,
        'color': CustomColors.fitsawBlue,
      },
      'routines': {
        'icon': FitsawIcons.routines,
        'color': CustomColors.fitsawRed,
      },
      'market': {
        'icon': FitsawIcons.market,
        'color': CustomColors.fitsawGreen,
      },
    };

    List<GestureDetector> barItems = <GestureDetector>[];

    // creates list of navigation bar buttons
    for (int i = 0; i < icons.length; i++) {
      String name = icons.keys.elementAt(i);
      Color iconColor = icons[name]!['color'];
      Color iconBackgroundColor = CustomColors.dmScreenBackground;

      if (widget.currentPage == name) {
        iconColor = CustomColors.dmScreenBackground;
        iconBackgroundColor = icons[name]!['color'];
      }

      // toggle certain portions of the border to avoid doubling up on one side
      // ex: left has a border on the top and right
      switch (i) {
        case 0:
          {
            break;
          }
        case 1:
          {
            break;
          }
        case 2:
          {
            break;
          }
        default:
          break;
      }

      barItems.add(
        // attatch a separate gesture detector for each tab button
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(
            context,

            // name of the page corresponding to the button
            widget.pages[i],
          ),
          // had to make custom sections in order to use borders properly
          child: Container(
            width: 60,
            height: 48,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(3)),
            ),
            child: Icon(
              icons[name]!['icon'],
              color: iconColor,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 70,
      // used Row instead of BottomNavBar because it was really annoying to
      // adjust the height of the BottomNavBar
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: barItems,
      ),
    );
  }
}
