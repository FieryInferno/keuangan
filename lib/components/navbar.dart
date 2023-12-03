import 'package:flutter/material.dart';
import 'package:keuangan/components/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:keuangan/providers/menu.dart';

class ItemNavbar extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;
  final GlobalKey key = GlobalKey();

  ItemNavbar({
    super.key,
    required this.icon,
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RenderBox renderBox =
            key.currentContext!.findRenderObject() as RenderBox;
        Offset widgetPosition = renderBox.localToGlobal(Offset.zero);

        // Gunakan widgetPosition untuk informasi posisi
        Menu menu = Provider.of<Menu>(context, listen: false);
        menu.position = widgetPosition.dx;
        menu.menu = title;
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            TextWidget(
              title,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Stack(
        children: [
          Consumer<Menu>(builder: ((context, value, child) {
            return AnimatedPositioned(
              top: 0,
              bottom: 5,
              left: value.position,
              width: 100,
              duration: const Duration(milliseconds: 75),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
              ),
            );
          })),
          Container(
            height: 40,
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
        ],
      ),
    );
  }
}
