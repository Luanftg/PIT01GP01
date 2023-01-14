import 'package:finances_group/src/data/repositories/finantial_movement_repository_firestore_imp.dart';
import 'package:finances_group/src/features/home/home_controller.dart';
import 'package:finances_group/src/features/home/home_state.dart';
import 'package:finances_group/src/features/home/widgets/charts/custom_linear_chart.dart';
import 'package:finances_group/src/features/home/widgets/charts/donut_chart_widget.dart';

import 'package:finances_group/src/features/home/widgets/homepage/action_app_bar.dart';
import 'package:finances_group/src/features/home/widgets/homepage/custom_bottom_app_bar.dart';
import 'package:finances_group/src/features/home/widgets/homepage/custom_drawer.dart';
import 'package:finances_group/src/features/home/widgets/homepage/custom_list_view_builder.dart';
import 'package:finances_group/src/features/home/widgets/homepage/title_app_bar.dart';

import 'package:finances_group/src/features/add_finantial_movement/add_finantial_movement_page.dart';
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
  HomeController controller =
      HomeController(FinantialMovementRepositoryFirestoreImp());

  @override
  void initState() {
    super.initState();

    _fetchUserLoged();
    _setStatusbarColor();
  }

  _fetchUserLoged() async {
    await controller.fetchUserLogged(widget.userLogged);
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
            var userModel = state.userLogged;
            child = Column(
              children: [
                const SizedBox(height: 150),
                DonutChartWidget(dataset: userModel.finantialMovementList),
                const SizedBox(height: 80),
                //const CustomIconButtonVisibility(),
                const SizedBox(height: 200),
                CustomLinearChart(weekData: userModel.finantialMovementList),
                const SizedBox(height: 80),
                CustomListViewBuilder(
                  userLogged: userModel,
                )
              ],
            );
          }

          if (state is HomeStateWelcome) {
            child = Center(
              child: Dismissible(
                key: GlobalKey(),
                child: const Card(
                  child: ListTile(
                    title: Text('Bem vindo ao Finance App'),
                    subtitle: Text(
                        "Adicione uma movimentação financeira para começar!"),
                  ),
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
                        await _fetchUserLoged();
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
                  userImage: userModel.photoURL, userName: userModel.name),
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
                  //CustomAppBar(userLogged: userModel),
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
            bottomNavigationBar: const CustomBottomAppBar(
              fabLocation: FloatingActionButtonLocation.centerDocked,
              shape: CircularNotchedRectangle(),
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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => FractionallySizedBox(
                      heightFactor: 0.8,
                      child: AddFinantialMovementPage(
                          userLogged: userModel, title: 'Adicionar'),
                    ),
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
