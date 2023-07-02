import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/basic_box.dart';
import 'package:fitsaw/ui/shared/widgets/search_box.dart';
import 'package:fitsaw/ui/shared/widgets/expandable_section.dart';

import 'package:fitsaw/utils/custom_colors.dart';

class Routines extends ConsumerStatefulWidget {
  const Routines({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoutinesState();
}

class _RoutinesState extends ConsumerState<Routines> {
  final TextEditingController _searchController = TextEditingController();

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
      body: Column(
        children: [
          SearchBox(_searchController),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wallpaper.png'),
                  fit: BoxFit.cover,
                ),
              ),
              constraints: const BoxConstraints.expand(),
              child: const ExpandableSection(
                "Your Routines",
                [
                  BasicBox(
                    Text(
                      "testing",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
