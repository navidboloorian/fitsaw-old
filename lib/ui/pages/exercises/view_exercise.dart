import 'package:fitsaw/db/database_helper.dart';
import 'package:fitsaw/ui/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';
import 'package:fitsaw/ui/shared/widgets/widgets.dart';
import 'package:fitsaw/db/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

class ViewExercise extends ConsumerStatefulWidget {
  final DatabaseHelper dbHelper;

  const ViewExercise({super.key, required this.dbHelper});

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

  // state list that tracks the tags in the tag input field
  List<String> _tags = [];

  // methods to manage the _tags state
  void _addTag(String tag) {
    setState(() => _tags = [..._tags, tag]);
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
      _tags = _tags;
    });
  }

  void _setTags(List<String> tags) {
    setState(() => _tags = tags);
  }

  void _createExercise() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      bool isTimed = ref.read(_timedSwitchButton);
      bool isWeighted = ref.read(_weightedSwitchButton);
      String description = _descriptionController.text;
      List<String> tags = _tags;

      widget.dbHelper.add(
        Exercise(
          ObjectId(),
          name,
          isTimed,
          isWeighted,
          description: description,
          tags: tags,
        ),
      );

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: CustomColors.fitsawGreen,
          duration: Duration(milliseconds: 500),
          content: Text(
            'Exercise Added!',
            style: TextStyle(color: CustomColors.dmScreenBackground),
          ),
        ),
      );
    }
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
      CustomContainer(
        TagTextField(
          addTag: _addTag,
          removeTag: _removeTag,
          setTags: _setTags,
        ),
      ),
    ];

    return Scaffold(
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
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: pageElements.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) => pageElements[index],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _createExercise,
                  child: const CustomContainer(
                    Center(
                      child: Text(
                        'Create',
                        style:
                            TextStyle(color: CustomColors.dmScreenBackground),
                      ),
                    ),
                    color: CustomColors.fitsawBlue,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
