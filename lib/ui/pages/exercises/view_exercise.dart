import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';

class ViewExercise extends StatefulWidget {
  const ViewExercise({super.key});

  @override
  State<ViewExercise> createState() => _ViewExerciseState();
}

class _ViewExerciseState extends State<ViewExercise> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<CustomContainer> _pageElements = [
      CustomContainer(
        TextFormField(
          maxLines: null,
          maxLength: 75,
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
      CustomContainer(
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Tags (separated by commas)',
            counterText: '',
          ),
          controller: _tagsController,
        ),
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
              itemCount: _pageElements.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => _pageElements[index],
            ),
          ),
        ),
      ),
    );
  }
}
