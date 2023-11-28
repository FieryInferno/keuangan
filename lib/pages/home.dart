import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:keuangan/components/text_widget.dart';
import 'package:keuangan/components/navbar.dart';

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

    int hour = DateTime.now().toLocal().hour;

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

class ButtonSlide extends StatelessWidget {
  final String direction;
  final Function()? onTap;

  const ButtonSlide(this.direction, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          shape: BoxShape.circle,
        ),
        child: Icon(
          direction == 'left' ? Icons.arrow_left : Icons.arrow_right,
          size: 30,
        ),
      ),
    );
  }
}

class SlideMonthLogic {
  static const Duration _duration = Duration(days: 30);

  static DateTime subtractMonth(DateTime datetime) =>
      datetime.subtract(_duration);
  static DateTime addMonth(DateTime datetime) => datetime.add(_duration);
}

class _SlideMonth extends State<SlideMonth> {
  late int _month;
  late int _year;
  late DateTime _datetime;
  final List<String> _months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  @override
  void initState() {
    super.initState();

    DateTime thisDatetime = DateTime.now().toLocal();
    _datetime = thisDatetime;
    _month = _datetime.month;
    _year = _datetime.year;
  }

  void updateState(DateTime newDatetime) {
    setState(() => _datetime = newDatetime);
    setState(() => _month = newDatetime.month);
    setState(() => _year = newDatetime.year);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonSlide(
          'left',
          onTap: () => updateState(SlideMonthLogic.subtractMonth(_datetime)),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 125,
          child: Column(
            children: [
              TextWidget(_months[_month - 1], weight: FontWeight.w900),
              TextWidget(
                _year.toString(),
                weight: FontWeight.w900,
                size: 15,
                color: Colors.amber,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        ButtonSlide(
          'right',
          onTap: () => updateState(SlideMonthLogic.addMonth(_datetime)),
        )
      ],
    );
  }
}

class SlideMonth extends StatefulWidget {
  const SlideMonth({super.key});

  @override
  State<SlideMonth> createState() => _SlideMonth();
}

class _DonutChartState extends State<DonutChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  startDegreeOffset: 250,
                  sectionsSpace: 0,
                  centerSpaceRadius: 100,
                  sections: [
                    PieChartSectionData(
                      value: 45,
                      color: Colors.greenAccent,
                      radius: 45,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 35,
                      color: Colors.blue.shade900,
                      radius: 25,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 20,
                      color: Colors.grey.shade400,
                      radius: 20,
                      showTitle: false,
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10.0,
                            spreadRadius: 10.0,
                            offset: const Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "2305",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class DonutChart extends StatefulWidget {
  const DonutChart({Key? key}) : super(key: key);

  @override
  State<DonutChart> createState() => _DonutChartState();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                ),
                const SizedBox(height: 20),
                const TextWidget('Analisa Pengeluaran'),
                const SizedBox(height: 20),
                const SlideMonth(),
                const DonutChart(),
              ],
            ),
          ),
          const Navbar(),
        ],
      ),
    );
  }
}
