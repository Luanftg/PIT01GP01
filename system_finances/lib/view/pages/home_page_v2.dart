import 'package:flutter/material.dart';
import 'package:system_finances/components/home/custom_linear_home_contact.dart';
import 'package:system_finances/controllers/home_controller.dart';
import 'package:system_finances/models/user_model.dart';
import 'package:system_finances/repositories/home_repository_imp.dart';
import 'package:system_finances/widgets/custom_card_home_widget.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      children: [
        Scaffold(
          backgroundColor: Colors.white54,
          appBar: AppBar(
            toolbarHeight: 200,
            backgroundColor: const Color.fromARGB(255, 112, 201, 19),
            title: const CustomLinearContactWidget(
                contactName: 'Luan',
                pathContactImage:
                    "https://avatars.githubusercontent.com/u/51548623?s=400&u=6c03bee3e53d430785828694d2a80c498d8607d4&v=4"),
          ),
          body: ValueListenableBuilder<List<UserModel>>(
            valueListenable: _controller.users,
            builder: (_, list, __) {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, idx) {
                  return Container();
                },
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(color: Colors.black54),
            unselectedItemColor: Colors.black26,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.compare_arrows), label: 'Transfers'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_outlined), label: 'Chart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
        Positioned(
          top: 170,
          width: MediaQuery.of(context).size.width,
          child: const CustomCardHomeWidget(),
        ),
      ],
    );
  }
}
