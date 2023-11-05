import 'package:flutter/material.dart';
import 'package:keuangan/pin_model.dart';
import 'package:provider/provider.dart';
import './pages/login.dart';

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
