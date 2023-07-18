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
  final bool isNew;
  final Exercise? exercise;

  const ViewExercise(
      {super.key, required this.dbHelper, required this.isNew, this.exercise});

  @override
  ConsumerState<ViewExercise> createState() => _ViewExerciseState();
}

class _ViewExerciseState extends ConsumerState<ViewExercise> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late final _weightedSwitchButton = switchButtonFamily('isWeighted');
  late final _timedSwitchButton = switchButtonFamily('isTimed');

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

  // if the exercise is new, adds to db; otherwise, updates db
  void _upsertExercise() {
    if (_formKey.currentState!.validate()) {
      ObjectId id = widget.isNew ? ObjectId() : widget.exercise!.id;
      String name = _nameController.text;
      bool isTimed = ref.read(_timedSwitchButton);
      bool isWeighted = ref.read(_weightedSwitchButton);
      List<String> tags = _tags;

      // want to make description null when empty
      String? description = _descriptionController.text.isEmpty
          ? null
          : _descriptionController.text;

      widget.dbHelper.update(
        Exercise(
          id,
          name,
          isTimed,
          isWeighted,
          description: description,
          tags: tags,
        ),
      );

      String snackbarMessage =
          widget.isNew ? 'Exercise Created!' : 'Exercise Updated!';

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: CustomColors.fitsawGreen,
          duration: const Duration(milliseconds: 500),
          content: Text(
            snackbarMessage,
            style: const TextStyle(color: CustomColors.dmScreenBackground),
          ),
        ),
      );
    }
  }

  void _populateExercise() {
    // set all the values of the form with data from the db
    SwitchButtonNotifier weightedSwitchButton =
        ref.read(_weightedSwitchButton.notifier);
    SwitchButtonNotifier timedSwitchButton =
        ref.read(_timedSwitchButton.notifier);

    _nameController.text = widget.exercise!.name;
    _setTags(widget.exercise!.tags.toList());
    if (widget.exercise!.description != null) {
      _descriptionController.text = widget.exercise!.description!;
    }

    // use "Future" to avoid provider being updated before widget is built out
    Future(() {
      timedSwitchButton.set(widget.exercise!.isTimed);
      weightedSwitchButton.set(widget.exercise!.isWeighted);
    });
  }

  @override
  void initState() {
    super.initState();

    if (!widget.isNew) {
      _populateExercise();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
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
        left: 'Reps',
        right: 'Time',
        provider: _timedSwitchButton,
      ),
      SwitchButton(
        left: 'Not Weighted',
        right: 'Weighted',
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
          preExistingTags: widget.isNew ? null : widget.exercise!.tags,
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
                  onTap: _upsertExercise,
                  child: CustomContainer(
                    Center(
                      child: Text(
                        widget.isNew ? 'Create' : 'Update',
                        style: const TextStyle(
                            color: CustomColors.dmScreenBackground),
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
