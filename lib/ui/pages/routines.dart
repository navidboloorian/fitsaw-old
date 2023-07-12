import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';

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
        // navbar logo
        title: const Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            height: 56,
          ),
        ),
      ),
      body: ListView(
        children: [
          SearchBox(_searchController),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        pages: widget.pages,
        currentPage: widget.pages[1],
      ),
    );
  }
}
