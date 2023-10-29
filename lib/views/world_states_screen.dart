import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  final colorsList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1AA268),
    const Color(0xffDE5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              PieChart(
                dataMap: const {
                  "Total": 20,
                  "Recovered": 15,
                  "Deaths": 5,
                },
                legendOptions:
                    const LegendOptions(legendPosition: LegendPosition.left),
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorsList,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .06),
                child: Card(
                  child: Column(
                    children: [
                      reusableRow("Total", "200"),
                      reusableRow("Total", "200"),
                      reusableRow("Total", "200"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff1AA260),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text("Track Countries"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget reusableRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(),
      ],
    ),
  );
}
