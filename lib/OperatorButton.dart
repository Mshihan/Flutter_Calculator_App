import 'package:flutter/material.dart';

class OperatorButton extends StatelessWidget {
  OperatorButton({this.operator, this.onPressed});

  final Icon operator;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(0x65453e4c),
      onPressed: onPressed,
      shape: CircleBorder(),
      padding: EdgeInsets.all(30),
      highlightColor: Color(0xFFFF0066),
      colorBrightness: Brightness.dark,
      child: operator,
    );
  }
}