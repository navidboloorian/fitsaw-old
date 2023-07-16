import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  final String name;
  final Function(String)? removeTag;
  final Color color;

  const TagContainer(
    this.name, {
    super.key,
    required this.color,
    this.removeTag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        removeTag == null ? null : removeTag!(name);
      },
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
            removeTag == null
                ? const SizedBox.shrink()
                : Icon(
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
