import 'package:flutter/material.dart';
import 'package:system_finances/components/home/custom_linear_home_contact.dart';
import 'package:system_finances/controllers/home_controller.dart';
import 'package:system_finances/models/user_model.dart';
import 'package:system_finances/repositories/home_repository_imp.dart';
import 'package:system_finances/widgets/custom_card_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<UserModel>>(
          valueListenable: _controller.users,
          builder: (_, list, __) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, idx) {
                return Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blueAccent,
                      child: CustomLinearContactWidget(
                        pathContactImage: list[idx].image,
                        contactName: list[idx].name,
                      ),
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      top: 130,
                      child: const CustomCardHomeWidget(),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
