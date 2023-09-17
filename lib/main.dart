import 'package:flutter/material.dart';
import 'package:keuangan/components/button_pin.dart';
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

  List<Container> loadButtonPin() {
    List<Container> data = [];
    List<ButtonPin> dataTemp = [];

    for (var i = 1; i <= 10; i++) {
      if (dataTemp.length == 3 || i == 10) {
        data.add(
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: dataTemp,
            ),
          ),
        );
        dataTemp = [];
      }

      dataTemp.add(ButtonPin(i));
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
            margin: const EdgeInsets.only(top: 10, bottom: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: loadCirclePin(),
            ),
          ),
          Column(
            children: [
              ...loadButtonPin(),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    SizedBox(width: 75),
                    ButtonPin(0),
                    SizedBox(
                      height: 75,
                      width: 75,
                      child: Icon(
                        Icons.arrow_back,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: const TextWidget('Gunakan Password'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
