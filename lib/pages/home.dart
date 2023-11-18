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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
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
          )
        ],
      ),
    );
  }
}
