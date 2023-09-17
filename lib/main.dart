import 'package:flutter/material.dart';
import 'package:keuangan/components/circle_pin.dart';
import 'package:keuangan/components/text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  List<CirclePin> loadCirclePin() {
    List<CirclePin> data = [];

    for (var i = 0; i < 6; i++) {
      data.add(const CirclePin());
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 200),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber,
            Colors.amber[900] as Color,
          ],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Masukan PIN kamu',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              decoration: TextDecoration.none,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: loadCirclePin(),
            ),
          ),
          Row(
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(75),
                    ),
                    color: Colors.amber[200],
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(121, 0, 0, 0),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                          offset: Offset(0, 5)),
                    ]),
                margin: const EdgeInsets.only(right: 10),
                child: const Center(
                  child: TextWidget('1', size: 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
