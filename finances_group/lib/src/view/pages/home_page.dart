import 'dart:math';
import 'package:finances_group/src/view/widgets/charts/custom_linear_chart.dart';
import 'package:finances_group/src/view/widgets/homepage/app_bar.dart';
import 'package:finances_group/src/view/widgets/homepage/balance.dart';
import 'package:finances_group/src/view/widgets/homepage/body_transactions.dart';
import 'package:finances_group/src/view/widgets/homepage/my_cards.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var random = Random();
    var weekData =
        List<double>.generate(100, (index) => random.nextDouble() * 100.0);
    return Scaffold(
      drawer: const Drawer(),
      body: SafeArea(
        child: ListView(
          children: [
            appBar,
            const Divider(
              color: Color.fromARGB(131, 65, 69, 88),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            const BalanceSection(),
            const SizedBox(height: 100),
            CustomLinearChart(weekData: weekData),
            const SizedBox(height: 80),
            const MyCards(),
            const BodyTransactions(),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBAr,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
