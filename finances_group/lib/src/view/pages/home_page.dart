import 'dart:developer';

import 'package:finances_group/src/controller/home_controller.dart';

import 'package:finances_group/src/data/repositories/finantial_movement_repository_prefs_imp.dart';

import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/widgets/body_teste.dart';
import 'package:finances_group/src/view/widgets/charts/custom_linear_chart.dart';
import 'package:finances_group/src/view/widgets/charts/donut_chart_widget.dart';
import 'package:finances_group/src/view/widgets/homepage/app_bar.dart';

import 'package:finances_group/src/view/widgets/homepage/custom_app_bar.dart';
import 'package:finances_group/src/view/widgets/homepage/custom_drawer.dart';
import 'package:finances_group/src/view/widgets/homepage/icon_button_visibility.dart';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../../models/data_item.dart';

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
    log('UserLogged = ${userLogged.toString()}');

    //var weekData = homeController.getWeekdata();

    var weekData = homeController.getWeekdata(userLogged);
    //List<DataItem>? dataset = homeController.getList(userLogged);

    List<DataItem>? dataset = homeController.getList(userLogged);

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
            //const MyCards(),
            // BodyTransactions(
            //   fmColor: dataset![0].color,
            //   fmImage: 'assets/icons/food.png',
            //   fmPrice: dataset[0].value.toString(),
            //   subtitle: 'description default',
            //   title: dataset[0].label,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBAr,
      floatingActionButton: floatingActionButton(context, userLogged),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
