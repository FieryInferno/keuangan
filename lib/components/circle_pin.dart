import 'package:flutter/material.dart';

class CirclePin extends StatelessWidget {
  const CirclePin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(right: 10),
    );
  }
}
