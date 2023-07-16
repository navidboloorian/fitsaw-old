import 'package:fitsaw/ui/shared/widgets/tag_container.dart';
import 'package:fitsaw/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class TaggedWrapper extends StatelessWidget {
  final List<String> tags;
  final Widget child;
  final List<Color> _tagColors = <Color>[
    CustomColors.fitsawBlue,
    CustomColors.fitsawPurple,
    CustomColors.fitsawRed,
    CustomColors.fitsawOrange,
    CustomColors.fitsawGreen,
  ];

  TaggedWrapper({
    super.key,
    required this.tags,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.topLeft, child: child),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 3,
            spacing: 3,
            children: [
              for (int i = 0; i < tags.length; i++)
                TagContainer(tags[i], color: _tagColors[i % _tagColors.length])
            ],
          ),
        ),
      ],
    );
  }
}
