import 'dart:core';

import 'package:finances_group/src/controller/home_controller.dart';

import 'package:finances_group/src/data/repositories/finantial_movement_repository_prefs_imp.dart';
import 'package:finances_group/src/models/finantial_movement.dart';

import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/pages/register_finantial_movement_page.dart';
import 'package:finances_group/src/view/widgets/charts/custom_linear_chart.dart';
import 'package:finances_group/src/view/widgets/charts/donut_chart_widget.dart';
import 'package:finances_group/src/view/widgets/homepage/app_bar.dart';

import 'package:finances_group/src/view/widgets/homepage/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../widgets/homepage/body_teste.dart';
import '../widgets/homepage/custom_app_bar.dart';
import '../widgets/homepage/custom_icon_buttom_visibility.dart';

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

  // Seleção da StatusBar Color
  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppCustomColors.dark);
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        HomeController(FinantialMovementRepositoryPrefsImp());

    final userLogged = ModalRoute.of(context)!.settings.arguments as UserModel;

    var weekData = homeController.getWeekdata(userLogged);

    List<FinantialMovement>? dataset = homeController.getList(userLogged);

    return Scaffold(
      drawer: CustomDrawer(
          userEmail: userLogged.email ?? '',
          userImage: userLogged.photoURL ?? "",
          userName: userLogged.name ?? ''),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            CustomAppBar(
                userName: userLogged.name, userImage: userLogged.photoURL),
            const Divider(
              color: Color.fromARGB(131, 65, 69, 88),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 150),
            DonutChartWidget(dataset: dataset),
            const SizedBox(height: 50),
            const CustomIconButtonVisibility(),
            const SizedBox(height: 200),
            CustomLinearChart(weekData: weekData),
            const SizedBox(height: 80),
            BodyTeste(
              userLogged: userLogged,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBAr,
      floatingActionButton: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppCustomColors.cyanGreen,
            ),
            child: const Icon(Icons.add),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => FractionallySizedBox(
                heightFactor: 0.8,
                child: RegisterFinantialMovementPage(userLogged: userLogged),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
