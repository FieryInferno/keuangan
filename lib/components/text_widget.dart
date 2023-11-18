import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String _text;
  final double size;
  final FontWeight weight;
  final Color color;

  const TextWidget(
    this._text, {
    super.key,
    this.size = 20,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        decoration: TextDecoration.none,
        fontFamily: 'Nunito',
      ),
    );
  }
}
