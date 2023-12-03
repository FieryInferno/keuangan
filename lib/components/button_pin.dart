import 'package:flutter/material.dart';
import 'package:keuangan/components/text_widget.dart';
import 'package:keuangan/providers/pin.dart';
import 'package:provider/provider.dart';

class ButtonPin extends StatelessWidget {
  final int number;

  const ButtonPin(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<Pin>(context, listen: false).add(number),
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(75)),
          color: Colors.amber[200],
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(121, 0, 0, 0),
              blurRadius: 10,
              spreadRadius: 0.5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(child: TextWidget('$number', size: 40)),
      ),
    );
  }
}
