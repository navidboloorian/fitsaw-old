import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    );
  }
}
