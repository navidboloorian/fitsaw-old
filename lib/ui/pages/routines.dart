import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/basic_box.dart';
import 'package:fitsaw/ui/shared/widgets/expandable_section.dart';

import 'package:fitsaw/utils/custom_colors.dart';

class Routines extends ConsumerStatefulWidget {
  const Routines({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoutinesState();
}

class _RoutinesState extends ConsumerState<Routines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: [
          Image.asset(
            'assets/images/wallpaper.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                ExpandableSection(
                  "Your Routines",
                  [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                      child: BasicBox(
                        Text(
                          "testing",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
                      child: BasicBox(
                        Text(
                          "testing",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
