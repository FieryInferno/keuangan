import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String _text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextDecoration decoration;

  const TextWidget(
    this._text, {
    super.key,
    this.size = 20,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        decoration: decoration,
        fontFamily: 'Nunito',
      ),
    );
  }
}
