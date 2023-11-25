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
    if (hour > 9 && hour <= 15) _greet = 'Selamat siang';
    if (hour > 15 && hour < 18) _greet = 'Selamat sore';
    if (hour >= 18) _greet = 'Selamat malam';
  }

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      '$_greet, M. BAGAS SETIA',
      weight: FontWeight.w500,
      size: 15,
    );
  }
}

class CardDashboard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String title;
  final IconData icon;

  const CardDashboard({
    super.key,
    required this.color,
    this.textColor = Colors.black,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: color,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: textColor,
            ),
            const SizedBox(height: 10),
            TextWidget(
              title,
              size: 15,
              color: textColor,
            ),
            TextWidget(
              'Rp. 10.000,00',
              size: 15,
              weight: FontWeight.w900,
              color: textColor,
            ),
          ],
        ),
      ),
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
            width: 150,
            height: 10,
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
            margin: const EdgeInsets.only(top: 50, left: 12.5, right: 12.5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Greeting(),
              Row(
                children: const [
                  Icon(Icons.payments),
                  SizedBox(width: 5),
                  TextWidget(
                    'APLIKASI KEUANGAN',
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const TextWidget('Dashboard'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CardDashboard(
                    color: Color(0xFFFFC312),
                    title: 'Pemasukan',
                    icon: Icons.paid,
                  ),
                  SizedBox(width: 10),
                  CardDashboard(
                    color: Color(0xFFEA2027),
                    textColor: Colors.white,
                    title: 'Pengeluaran',
                    icon: Icons.price_change,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: const Color(0xFF3ae374),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF3ae374).withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: const [
                          TextWidget(
                            'Total Saldo',
                            size: 15,
                          ),
                          SizedBox(width: 10),
                          TextWidget(
                            'Rp. 10.000,00',
                            size: 15,
                            weight: FontWeight.w900,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]),
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
