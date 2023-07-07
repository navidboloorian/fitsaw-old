import 'package:fitsaw/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class TagTextField extends StatefulWidget {
  final TextEditingController controller;
  final List<String>? preExistingTags;

  const TagTextField(
      {super.key, required this.controller, this.preExistingTags});

  @override
  State<TagTextField> createState() => _TagTextFieldState();
}

class _TagTextFieldState extends State<TagTextField> {
  // list of tag names, useful for other widgets to access
  List<String> tagNames = <String>[];

  final List<TagButton> _tagButtons = <TagButton>[];
  final List<Color> _tagColors = <Color>[
    CustomColors.fitsawBlue,
    CustomColors.fitsawPurple,
    CustomColors.fitsawRed,
    CustomColors.fitsawOrange,
    CustomColors.fitsawGreen,
  ];

  // used to add a tag to the tag list
  void _addTag() {
    // detect when a comma is entered
    if (widget.controller.text.contains(',')) {
      int delimIndex = widget.controller.text.indexOf(',');

      // trim spaces to evaluate the text only
      String tag = widget.controller.text.substring(0, delimIndex).trim();
      bool tagExists = false;

      // ensure duplicate tags don't exist
      for (TagButton tagButton in _tagButtons) {
        if (tagButton.name == tag) {
          tagExists = true;
          break;
        }
      }

      // prevent tags with only spaces, require at least one alphanumeric
      if (!tagExists && RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(tag)) {
        setState(
          () {
            tagNames.add(tag);
            _tagButtons.add(
              TagButton(
                tag,
                removeTag: _removeTag,
                color: _tagColors[_tagButtons.length % _tagColors.length],
              ),
            );
          },
        );

        // if there are chars to the right of the comma keep them
        if (delimIndex != widget.controller.text.length - 1) {
          widget.controller.text =
              widget.controller.text.substring(delimIndex + 1);
        } else {
          widget.controller.text = '';
        }
      } else {
        widget.controller.text = '';
      }
    }
  }

  // used by tagButtons to remove tags based on their names
  // removal by names is another reason why it's important that names are unique
  void _removeTag(String name) {
    for (TagButton tagButton in _tagButtons) {
      if (tagButton.name == name) {
        setState(
          () {
            tagNames.remove(name);
            _tagButtons.remove(tagButton);
          },
        );
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_addTag);

    if (widget.preExistingTags != null) {
      setState(
        () {
          tagNames = widget.preExistingTags!;

          for (String tagName in tagNames) {
            _tagButtons.add(
              TagButton(
                tagName,
                removeTag: _removeTag,
                color: _tagColors[_tagButtons.length % _tagColors.length],
              ),
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: const InputDecoration(
            hintText: 'Tags (separate with commas)',
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 3,
            spacing: 3,
            children: _tagButtons,
          ),
        ),
      ],
    );
  }
}

class TagButton extends StatelessWidget {
  final String name;
  final Function(String) removeTag;
  final Color color;

  const TagButton(
    this.name, {
    super.key,
    required this.removeTag,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removeTag(name),
      child: Container(
        height: 25,
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(color: color),
            ),
            const SizedBox(width: 3),
            Icon(
              Icons.close,
              size: 10,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
