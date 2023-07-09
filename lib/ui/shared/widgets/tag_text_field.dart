import 'package:flutter/material.dart';
import 'package:fitsaw/utils/custom_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitsaw/ui/shared/providers/tag_list_provider.dart';

class TagTextField extends ConsumerStatefulWidget {
  final List<String>? preExistingTags;

  const TagTextField({super.key, this.preExistingTags});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagTextFieldState();
}

class _TagTextFieldState extends ConsumerState<TagTextField> {
  final TextEditingController _controller = TextEditingController();
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
    if (_controller.text.contains(',')) {
      final tagNamesList = ref.watch(tagListProvider.notifier);
      int delimIndex = _controller.text.indexOf(',');

      // trim spaces to evaluate the text only
      String tag = _controller.text.substring(0, delimIndex).trim();
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
            tagNamesList.add(tag);
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
    final tagNamesList = ref.watch(tagListProvider.notifier);

    for (TagButton tagButton in _tagButtons) {
      if (tagButton.name == name) {
        setState(
          () {
            tagNamesList.remove(name);
            _tagButtons.remove(tagButton);
          },
        );
        break;
      }
    }
  }

  @override
  void initState() {
    // list of tag names, useful for other widgets to access
    final tagNamesRead = ref.read(tagListProvider);
    final tagNamesList = ref.read(tagListProvider.notifier);

    super.initState();

    _controller.addListener(_addTag);

    if (widget.preExistingTags != null) {
      setState(
        () {
          tagNamesList.set(widget.preExistingTags!);

          for (String tagName in tagNamesRead) {
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
        constraints: const BoxConstraints(minHeight: 25),
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: color),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // use Flexible to wrap text in container
            Flexible(
              child: Text(
                name,
                style: TextStyle(color: color),
              ),
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
