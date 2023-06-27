import 'package:flutter/material.dart';

class BasicBox extends StatelessWidget {
  final Widget widget;
  final double padding;

  const BasicBox(this.widget, {super.key, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(padding, padding / 2, padding, padding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget,
    );
  }
}
