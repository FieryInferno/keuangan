import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:keuangan/pin_model.dart';
import './home.dart';
import 'package:keuangan/components/button_pin.dart';
import 'package:keuangan/components/circle_pin.dart';
import 'package:keuangan/components/text_widget.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPassword();
}

class _InputPassword extends State<InputPassword> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !_showPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Password',
        suffixIcon: GestureDetector(
          onTap: () => setState(() => _showPassword = !_showPassword),
          child: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
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
            margin: const EdgeInsets.only(top: 10),
            child: Consumer<PinModel>(
              builder: (context, value, child) {
                List<int> pin = value.pin;

                if (pin.length == 6) {
                  if (pin.join('') == '336699') {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Home(),
                        ),
                      );
                    });
                  } else {
                    Provider.of<PinModel>(context).showPinSalah = true;
                    Provider.of<PinModel>(context, listen: false).removeAll();
                  }
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: loadCirclePin(pin.length),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 35),
            child: Consumer<PinModel>(
              builder: (context, value, child) {
                return value.showPinSalah
                    ? Text(
                        'Pin salah',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red[900], fontSize: 20),
                      )
                    : const SizedBox();
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
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    isDismissible: false,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Container(
                            height: 300,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const TextWidget('Gunakan Password'),
                                          GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: const Icon(Icons.close),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 16,
                                        ),
                                        child: InputPassword(),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Lupa Password?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => {},
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              color: Colors.amber[800],
                                            ),
                                            height: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  'Login',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
