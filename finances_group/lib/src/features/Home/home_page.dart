import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/data/repositories/finantial_movement_repository_firestore.dart';
import 'package:finances_group/src/features/add_finantial_movement/widgets/custom_switch.dart';
import 'package:finances_group/src/features/home/home_controller.dart';
import 'package:finances_group/src/features/home/home_state.dart';
import 'package:finances_group/src/features/home/widgets/charts/custom_linear_chart.dart';

import 'package:finances_group/src/features/home/widgets/charts/donut_chart_widget.dart';

import 'package:finances_group/src/features/home/widgets/homepage/action_app_bar.dart';
import 'package:finances_group/src/features/home/widgets/homepage/custom_bottom_app_bar.dart';
import 'package:finances_group/src/features/home/widgets/homepage/custom_drawer.dart';
import 'package:finances_group/src/features/home/widgets/homepage/custom_list_view_builder.dart';
import 'package:finances_group/src/features/home/widgets/homepage/title_app_bar.dart';
import 'package:finances_group/src/shared/widgets/custom_icon_buttom_visibility.dart';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../../models/user_model.dart';
import '../../shared/design/colors/app_custom_colors.dart';

class HomePage extends StatefulWidget {
  final UserModel userLogged;
  const HomePage({super.key, required this.userLogged});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController(
      FinantialMovementRepositoryFirestore(FirebaseFirestore.instance));

  @override
  void initState() {
    super.initState();
    CustomSwitch.valueSwitch.addListener(() {
      controller.fetchFinantialMovement();
      if (mounted) {
        setState(() {});
      }
    });
    _cacheFinantialMoventList();
    _setStatusbarColor();
  }

  _cacheFinantialMoventList() async {
    await controller.cacheFinantialMoventList(widget.userLogged.id);
  }

  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppCustomColors.dark);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, state, child) {
          if (state is HomeStateLoading) {
            child = const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is HomeStateSucess) {
            var finantialMovementList = state.finantialMovementList;

            child = Column(
              children: [
                const CustomSwitch(),
                //const CustomCardHomeWidget(),
                const SizedBox(height: 150),
                DonutChartWidget(dataset: finantialMovementList),
                const SizedBox(height: 50),
                const CustomIconButtonVisibility(),
                const SizedBox(height: 200),
                CustomLinearChart(weekData: finantialMovementList),
                const SizedBox(height: 80),
                CustomListViewBuilder(
                  userModel: widget.userLogged,
                  finantialMovementList: finantialMovementList,
                )
              ],
            );
          }

          if (state is HomeStateWelcome) {
            child = SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const CustomSwitch(),
                    Dismissible(
                      key: GlobalKey(),
                      child: const Card(
                        child: ListTile(
                          title: Text('Bem vindo ao Finance App'),
                          subtitle: Text(
                              "Adicione uma movimentação financeira para começar!"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is HomeStateError) {
            child = Center(
              child: Column(
                children: [
                  const Text('Erro ao ler informações do usuário.'),
                  TextButton(
                      onPressed: () async {
                        await _cacheFinantialMoventList();
                      },
                      child: const Text('Tentar Novamente'))
                ],
              ),
            );
          }

          var userModel = widget.userLogged;

          return Scaffold(
            drawer: CustomDrawer(
              userModel: userModel,
            ),
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              toolbarHeight: 75,
              title: TitleAppBar(
                userModel: userModel,
              ),
              actions: [
                ActionAppBar(
                  userLogged: userModel,
                )
              ],
              automaticallyImplyLeading: false,
            ),
            body: SafeArea(
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  const Divider(
                    color: AppCustomColors.divider,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  child ?? const SizedBox.shrink(),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomAppBar(
              fabLocation: FloatingActionButtonLocation.centerDocked,
              shape: const CircularNotchedRectangle(),
              userModel: userModel,
            ),
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
                  Navigator.of(context).pushReplacementNamed(
                    '/add-finantial-movement',
                    arguments: {'title': 'Adicionar', 'userLoged': userModel},
                  );
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        }
        //},
        );
  }
}
