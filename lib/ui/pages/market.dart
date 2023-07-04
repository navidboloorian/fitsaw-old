import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';

import 'package:fitsaw/utils/custom_colors.dart';

class Market extends ConsumerStatefulWidget {
  final List<String> pages;

  const Market({super.key, required this.pages});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MarketState();
}

class _MarketState extends ConsumerState<Market> {
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
      body: Text('Market'),
      bottomNavigationBar: BottomBar(
        pages: widget.pages,
        currentPage: widget.pages[2],
      ),
    );
  }
}
