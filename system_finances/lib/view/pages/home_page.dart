import 'package:flutter/material.dart';
import 'package:system_finances/controllers/home_controller.dart';
import 'package:system_finances/models/user_model.dart';
import 'package:system_finances/repositories/home_repository_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryMock());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          toolbarHeight: 200,
          actions: [
            Row(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.amber,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Luan'),
                        Text('LuanFtg'),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(260, 0, 16, 0),
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
          ]),
      body: ValueListenableBuilder<List<UserModel>>(
          valueListenable: _controller.users,
          builder: (_, list, __) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, idx) => Image.network(list[idx].image),
            );
          }),
    );
  }
}
