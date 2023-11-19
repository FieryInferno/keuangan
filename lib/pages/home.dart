import 'package:flutter/material.dart';
import 'package:keuangan/components/text_widget.dart';

class ItemNavbar extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;

  const ItemNavbar({
    super.key,
    required this.icon,
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: active
          ? BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber,
            )
          : null,
      child: Column(
        children: [
          Icon(
            icon,
            size: 35,
          ),
          TextWidget(
            title,
            size: 15,
          )
        ],
      ),
    );
  }
}

class Greeting extends StatefulWidget {
  const Greeting({super.key});

  @override
  State<Greeting> createState() => _Greeting();
}

class _Greeting extends State<Greeting> {
  String _greet = '';

  @override
  void initState() {
    super.initState();

    DateTime datetime = DateTime.now().toLocal();
    int hour = datetime.hour;

    if (hour > 0 && hour <= 9) _greet = 'Selamat pagi';
    if (hour > 9 && hour <= 18) _greet = 'Selamat sore';
    if (hour > 18) _greet = 'Selamat malam';
  }

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      '$_greet, M. BAGAS SETIA',
      weight: FontWeight.w600,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            width: 80,
            height: 40,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber,
                    blurRadius: 60,
                    spreadRadius: 50,
                  )
                ],
                color: Colors.amber,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 12.5),
            child: const Greeting(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 75,
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  ItemNavbar(
                    icon: Icons.home,
                    title: 'Beranda',
                    active: true,
                  ),
                  ItemNavbar(
                    icon: Icons.receipt_long,
                    title: 'Transaksi',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
