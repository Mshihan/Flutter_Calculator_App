import 'package:flutter/material.dart';


class NumberButton extends StatelessWidget {
  NumberButton({@required this.number, this.onPressed});

  final int number;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(0x35453e4c),
      padding: EdgeInsets.all(20),
      highlightColor: Color(0xFF00ffff),
      child: Text(
        number.toString(),
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
    );
  }
}
