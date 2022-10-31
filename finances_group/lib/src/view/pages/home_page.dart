import 'package:finances_group/src/controller/home_controller.dart';
import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/widgets/charts/custom_linear_chart.dart';
import 'package:finances_group/src/view/widgets/charts/donut_chart_widget.dart';
import 'package:finances_group/src/view/widgets/homepage/app_bar.dart';

import 'package:finances_group/src/view/widgets/homepage/body_transactions.dart';
import 'package:finances_group/src/view/widgets/homepage/custom_drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../../models/data_item.dart';
import '../widgets/homepage/my_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _setStatusbarColor();
    super.initState();
  }

  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppCustomColors.dark);
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController();
    var weekData = homeController.getWeekdata();
    final PageController pageController = PageController();

    List<DataItem> dataset = homeController.getList();
    return Scaffold(
      drawer: CustomDrawer(0, pageController: pageController),
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
            //const BalanceSection(),
            const SizedBox(height: 150),
            DonutChartWidget(dataset: dataset),
            const SizedBox(height: 50),
            const Icon(Icons.visibility_off),
            const SizedBox(height: 200),
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
