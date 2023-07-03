import 'package:fitsaw/fitsaw_icons.dart';
import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';

class BottomBar extends StatefulWidget {
  final List<String> pages;
  final String currentPage;

  const BottomBar({super.key, required this.pages, required this.currentPage});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    // map icons to simply names
    const Map<String, String> icons = <String, String>{
      'exercises': 'assets/images/icons/exercises.png',
      'routines': 'assets/images/icons/routines.png',
      'market': 'assets/images/icons/market.png',
    };

    List<BottomNavigationBarItem> barItems = <BottomNavigationBarItem>[];
    BorderSide borderSpecs = const BorderSide(width: 2, color: Colors.black);

    // creates list of navigation bar buttons
    for (int i = 0; i < icons.length; i++) {
      String name = icons.keys.elementAt(i);
      Color buttonBackgroundColor = (name == widget.currentPage)
          ? CustomColors.fitsawBlue
          : CustomColors.lmPrimaryBlockBackground;

      late Border iconBorder;

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
        BottomNavigationBarItem(
          label: name,
          icon: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: 56,
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
      height: 56,
      child: OverflowBox(
        maxHeight: double.infinity,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => Navigator.pushReplacementNamed(
            context,
            widget.pages[index],
          ),
          elevation: 0,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: CustomColors.lmPrimaryBlockBackground,
          items: barItems,
        ),
      ),
    );
  }
}
