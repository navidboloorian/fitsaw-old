import 'package:fitsaw/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget widget;
  final double padding;
  final Color color;

  const CustomContainer(this.widget,
      {super.key,
      this.padding = 10,
      this.color = CustomColors.dmPrimaryBlockBackground});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        padding:
            EdgeInsets.fromLTRB(padding, padding / 2, padding, padding / 2),
        decoration: BoxDecoration(
          color: color,
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
