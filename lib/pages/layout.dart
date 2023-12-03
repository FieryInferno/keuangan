import 'package:flutter/material.dart';
import 'package:keuangan/components/navbar.dart';
import 'package:keuangan/pages/transaksi.dart';
import 'package:keuangan/pages/home.dart';
import 'package:keuangan/providers/menu.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  final Map<String, Widget> menuContents = {
    'Beranda': const Home(),
    'Transaksi': const Transaksi()
  };

  Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Menu(),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Consumer<Menu>(
              builder: (context, menu, child) {
                return menuContents[menu.menu]!;
              },
            ),
            const Navbar(),
          ],
        ),
      ),
    );
  }
}
