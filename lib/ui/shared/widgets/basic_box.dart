import 'package:fitsaw/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class BasicBox extends StatelessWidget {
  final Widget widget;
  final double padding;

  const BasicBox(this.widget, {super.key, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding:
            EdgeInsets.fromLTRB(padding, padding / 2, padding, padding / 2),
        decoration: BoxDecoration(
          color: CustomColors.dmPrimaryBlockBackground,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Align(alignment: Alignment.centerLeft, child: widget),
      ),
    );
  }
}
