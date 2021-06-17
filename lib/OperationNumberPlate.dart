import 'package:flutter/material.dart';

class OperatorNumberPlate extends StatelessWidget {

  OperatorNumberPlate({this.operator,this.colour});

  final IconData operator;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Icon(
          operator,
          color: colour,
          size: 20,
        ),
        alignment: Alignment.topLeft,
      ),
    );
  }
}
