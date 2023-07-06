import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';

class ViewExercise extends StatefulWidget {
  const ViewExercise({super.key});

  @override
  State<ViewExercise> createState() => _ViewExerciseState();
}

class _ViewExerciseState extends State<ViewExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 84,
        backgroundColor: CustomColors.lmScreenBackground,

        // navbar logo
        title: const Text('New Exercise'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints.expand(),
            ),
          ),
        ],
      ),
    );
  }
}
