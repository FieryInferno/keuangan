import 'package:flutter/material.dart';

class CirclePin extends StatelessWidget {
  final bool isActive;

  const CirclePin({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: isActive ? Colors.deepPurple : Colors.white,
      ),
      margin: const EdgeInsets.only(right: 10),
    );
  }
}
