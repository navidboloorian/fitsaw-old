import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';

import 'package:fitsaw/utils/custom_colors.dart';

class Routines extends ConsumerStatefulWidget {
  final List<String> pages;

  const Routines({super.key, required this.pages});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoutinesState();
}

class _RoutinesState extends ConsumerState<Routines> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: Column(
                children: const [
                  ExpandableSection(
                    "Your Routines",
                    [
                      BasicBox(
                        Text(
                          "testing",
                          style: TextStyle(),
                        ),
                      ),
                      BasicBox(
                        Text(
                          "testing",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ExpandableSection(
                    "Downloaded Routines",
                    [
                      BasicBox(
                        Text(
                          "testing",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(
        pages: widget.pages,
        currentPage: widget.pages[1],
      ),
    );
  }
}
