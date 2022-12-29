import 'package:finances_group/src/features/Home/widgets/homepage/body_teste.dart';
import 'package:finances_group/src/features/Home/widgets/homepage/custom_app_bar.dart';
import 'package:finances_group/src/features/Home/widgets/homepage/custom_drawer.dart';
import 'package:finances_group/src/features/home/widgets/charts/custom_linear_chart.dart';
import 'package:finances_group/src/features/home/widgets/charts/donut_chart_widget.dart';

import 'package:finances_group/src/features/register_finantial_movement/register_finantial_movement_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../../models/user_model.dart';
import '../../shared/design/colors/app_custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get bottomAppBAr => null;

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
    ValueNotifier<UserModel?> userLogged = ValueNotifier<UserModel>(
        ModalRoute.of(context)!.settings.arguments as UserModel);

    return ValueListenableBuilder(
        valueListenable: userLogged,
        builder: (context, state, child) {
          if (state is UserModel) {
            return Scaffold(
              drawer: CustomDrawer(
                userEmail: state.email ?? '',
                userImage: state.photoURL!.isNotEmpty
                    ? state.photoURL!
                    : "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
                userName: state.name ?? '',
              ),
              body: SafeArea(
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    CustomAppBar(
                        userName: state.name,
                        userImage: state.photoURL,
                        userLogged: state),
                    const Divider(
                      color: Color.fromARGB(131, 65, 69, 88),
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(height: 150),
                    DonutChartWidget(dataset: state.finantialMovementList),
                    const SizedBox(height: 80),
                    //const CustomIconButtonVisibility(),
                    const SizedBox(height: 200),
                    CustomLinearChart(weekData: state.finantialMovementList),
                    const SizedBox(height: 80),
                    BodyTeste(
                      userLogged: state,
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
                        child: RegisterFinantialMovementPage(userLogged: state),
                      ),
                    );
                  }),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
