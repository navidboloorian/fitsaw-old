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
    const Map<String, String> icons = <String, String>{
      'exercises': 'assets/images/icons/exercises.png',
      'routines': 'assets/images/icons/routines.png',
      'market': 'assets/images/icons/market.png',
    };

    List<GestureDetector> barItems = <GestureDetector>[];
    BorderSide borderSpecs = const BorderSide(width: 2, color: Colors.black);

    // creates list of navigation bar buttons
    for (int i = 0; i < icons.length; i++) {
      String name = icons.keys.elementAt(i);

      // selected tab has a blue background
      Color buttonBackgroundColor = (name == widget.currentPage)
          ? CustomColors.fitsawBlue
          : CustomColors.lmPrimaryBlockBackground;

      late Border iconBorder;

      // toggle certain portions of the border to avoid doubling up on one side
      // ex: left has a border on the top and right
      switch (i) {
        case 0:
          {
            iconBorder = Border(top: borderSpecs, right: borderSpecs);
            break;
          }
        case 1:
          {
            iconBorder = Border(top: borderSpecs);
            break;
          }
        case 2:
          {
            iconBorder = Border(top: borderSpecs, left: borderSpecs);
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
            // each button takes a third of the screen
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              color: buttonBackgroundColor,
              border: iconBorder,
            ),
            child: Image.asset(
              icons[name]!,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 40,
      // used Row instead of BottomNavBar because it was really annoying to
      // adjust the height of the BottomNavBar
      child: Row(
        children: barItems,
      ),
    );
  }
}
