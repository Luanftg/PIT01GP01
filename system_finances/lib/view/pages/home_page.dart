import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    );
  }
}
