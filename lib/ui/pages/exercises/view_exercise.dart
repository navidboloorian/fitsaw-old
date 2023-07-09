import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';
import 'package:fitsaw/ui/shared/providers/switch_button_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewExercise extends ConsumerStatefulWidget {
  const ViewExercise({super.key});

  @override
  ConsumerState<ViewExercise> createState() => _ViewExerciseState();
}

class _ViewExerciseState extends ConsumerState<ViewExercise> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // initialize notifiers for switches
  late final _timedSwitchButton = switchButtonFamily('isTimed');
  late final _weightedSwitchButton = switchButtonFamily('isWeighted');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageElements = [
      CustomContainer(
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Exercise name',
            counterText: '',
          ),
          controller: _nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'A name is required';
            }
            return null;
          },
        ),
      ),
      SwitchButton(
        left: "Reps",
        right: "Time",
        provider: _timedSwitchButton,
      ),
      SwitchButton(
        left: "Not Weighted",
        right: "Weighted",
        provider: _weightedSwitchButton,
      ),
      CustomContainer(
        TextFormField(
          minLines: 5,
          maxLines: null,
          decoration: const InputDecoration(
            hintText: 'Description',
            counterText: '',
          ),
          controller: _descriptionController,
        ),
      ),
      const CustomContainer(
        TagTextField(),
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // navbar logo
        title: const Image(
          image: AssetImage('assets/images/logo.png'),
          height: 56,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.separated(
              itemCount: pageElements.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => pageElements[index],
            ),
          ),
        ),
      ),
    );
  }
}
