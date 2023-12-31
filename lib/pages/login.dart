import './layout.dart';
import './../user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:keuangan/providers/pin.dart';
import 'package:keuangan/components/button_pin.dart';
import 'package:keuangan/components/circle_pin.dart';
import 'package:keuangan/components/text_widget.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;
  final bool wrongPassword;

  const InputPassword({
    super.key,
    required this.controller,
    required this.wrongPassword,
  });

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
        errorText: widget.wrongPassword ? 'Password salah' : null,
      ),
      controller: widget.controller,
    );
  }
}

class LoginPassword extends StatefulWidget {
  const LoginPassword({super.key});

  @override
  State<LoginPassword> createState() => _LoginPassword();
}

class _LoginPassword extends State<LoginPassword> {
  final TextEditingController _passwordController = TextEditingController();
  bool _wrongPassword = false;
  bool _disabledButton = true;
  User user = User();

  @override
  void initState() {
    _passwordController.addListener(() {
      if (_passwordController.text.trim() == '') {
        setState(() => _disabledButton = true);
      } else {
        setState(() => _disabledButton = false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          'Gunakan Password',
                          weight: FontWeight.w900,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 16,
                      ),
                      child: InputPassword(
                        controller: _passwordController,
                        wrongPassword: _wrongPassword,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => user.forgotPassword(),
                  child: const TextWidget(
                    'Lupa Password?',
                    weight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    String password = _passwordController.text.trim();

                    if (password != '') {
                      if (user
                          .loginByPassword(_passwordController.text.trim())) {
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Layout(),
                            ),
                          );
                        });
                      } else {
                        setState(() => _wrongPassword = true);
                      }
                    }
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            color: _disabledButton
                                ? Colors.grey[300]
                                : Colors.amber[800],
                          ),
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              TextWidget(
                                'Login',
                                weight: FontWeight.w900,
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
      padding: const EdgeInsets.only(top: 150),
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
          const TextWidget(
            'Masukan PIN kamu',
            weight: FontWeight.w900,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Consumer<Pin>(
              builder: (context, value, child) {
                List<int> pin = value.pin;

                if (pin.length == 6) {
                  if (User().loginByPin(pin.join(''))) {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Layout(),
                        ),
                      );
                    });
                  } else {
                    Provider.of<Pin>(context).showPinSalah = true;
                    Provider.of<Pin>(context, listen: false).removeAll();
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
            height: 30,
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            child: Consumer<Pin>(
              builder: (context, value, child) {
                return value.showPinSalah
                    ? const TextWidget(
                        'Pin salah',
                        weight: FontWeight.w600,
                        color: Colors.red,
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
                      onTap: () =>
                          Provider.of<Pin>(context, listen: false).delete(),
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
                      return const LoginPassword();
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
                  child: const TextWidget(
                    'Gunakan Password',
                    weight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
