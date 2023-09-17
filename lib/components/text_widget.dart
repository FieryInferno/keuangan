import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double size;

  const TextWidget(this.text, {super.key, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: size,
        decoration: TextDecoration.none,
      ),
    );
  }
}
