import 'package:flutter/material.dart';
import 'package:keuangan/components/button_pin.dart';
import 'package:keuangan/components/circle_pin.dart';
import 'package:keuangan/components/text_widget.dart';
import 'package:keuangan/pin_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => PinModel(),
          child: const Login(),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  List<CirclePin> loadCirclePin(int length) {
    List<CirclePin> data = [];

    for (var i = 0; i < length; i++) {
      data.add(const CirclePin(isActive: true));
    }

    for (var i = 0; i < 6 - length; i++) {
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
            child: Consumer<PinModel>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: loadCirclePin(value.pin.length),
                );
              },
            ),
          ),
          Column(
            children: [
              ...loadButtonPin(),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 75),
                    const ButtonPin(0),
                    GestureDetector(
                      onTap: () => Provider.of<PinModel>(context, listen: false)
                          .delete(),
                      child: const SizedBox(
                        height: 75,
                        width: 75,
                        child: Icon(
                          Icons.arrow_back,
                          size: 50,
                        ),
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
