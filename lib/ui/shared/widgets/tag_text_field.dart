import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/utils/custom_colors.dart';
import 'package:fitsaw/ui/shared/widgets/tag_container.dart';

class TagTextField extends ConsumerStatefulWidget {
  /// The list of tags that are added to the database are managed externally. As
  /// such, the below functions are responsible for setting that list's state
  /// when changes are made to the tags in this widget.
  final Function(String) addTag;
  final Function(String) removeTag;
  final Function(List<String>) setTags;
  final List<String>? preExistingTags;

  const TagTextField({
    super.key,
    required this.addTag,
    required this.removeTag,
    required this.setTags,
    this.preExistingTags,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagTextFieldState();
}

class _TagTextFieldState extends ConsumerState<TagTextField> {
  late TextEditingController _controller;
  late List<TagContainer> _tagButtons;
  late List<Color> _tagColors;

  // used to add a tag to the tag list
  void _addTag() {
    // detect when a comma is entered
    if (_controller.text.contains(',')) {
      int delimIndex = _controller.text.indexOf(',');

      // trim spaces to evaluate the text only
      String tag = _controller.text.substring(0, delimIndex).trim();
      bool tagExists = false;

      // ensure duplicate tags don't exist
      for (TagContainer tagButton in _tagButtons) {
        if (tagButton.name == tag) {
          tagExists = true;
          break;
        }
      }

      // prevent tags with only spaces, require at least one alphanumeric
      if (!tagExists && RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(tag)) {
        // add tag to the outer state
        widget.addTag(tag);

        setState(
          () {
            _tagButtons.add(
              TagContainer(
                tag,
                removeTag: _removeTag,
                color: _tagColors[_tagButtons.length % _tagColors.length],
              ),
            );
          },
        );

        // if there are chars to the right of the comma keep them
        if (delimIndex != _controller.text.length - 1) {
          _controller.text = _controller.text.substring(delimIndex + 1);
        } else {
          _controller.text = '';
        }
      } else {
        _controller.text = '';
      }
    }
  }

  // used by tagButtons to remove tags based on their names
  // removal by names is another reason why it's important that names are unique
  void _removeTag(String name) {
    for (TagContainer tagButton in _tagButtons) {
      if (tagButton.name == name) {
        // remove from outer list's tags
        widget.removeTag(name);

        setState(
          () {
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

    _controller = TextEditingController();
    _tagButtons = <TagContainer>[];
    _tagColors = <Color>[
      CustomColors.fitsawBlue,
      CustomColors.fitsawPurple,
      CustomColors.fitsawRed,
      CustomColors.fitsawOrange,
      CustomColors.fitsawGreen,
    ];

    _controller.addListener(_addTag);

    if (widget.preExistingTags != null) {
      setState(
        () {
          for (String tagName in widget.preExistingTags!) {
            _tagButtons.add(
              TagContainer(
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
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Tags (separate with commas)',
          ),
        ),
        // only show the extra spacing if there are tags
        _tagButtons.isNotEmpty
            ? const SizedBox(height: 5)
            : const SizedBox.shrink(),
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
