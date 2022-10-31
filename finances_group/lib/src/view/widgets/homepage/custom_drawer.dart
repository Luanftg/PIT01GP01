// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget {
  final PageController pageController;
  int indexPage = 0;

  CustomDrawer(int indexPage, {super.key, required this.pageController});
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Nicolas Kormann'),
            accountEmail: const Text('nicolaskormann@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Image.network(
                  'https://media-exp1.licdn.com/dms/image/C4D03AQEoqxz5Ur8xIw/profile-displayphoto-shrink_200_200/0/1661958896044?e=1671667200&v=beta&t=s1ikt5EvvbLEXcHOjrah9mVcUDrlahFACjBjH3C5TS8'),
            ),
          ),
          ListTile(
            title: const Text('Principal'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              widget.pageController.jumpToPage(0);
              Navigator.pop(context);
              setState(
                () {
                  widget.indexPage = 0;
                },
              );
            },
          ),
          ListTile(
            title: const Text('Tarefas'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              widget.pageController.jumpToPage(1);
              Navigator.pop(context);
              setState(
                () {
                  widget.indexPage = 1;
                },
              );
            },
          ),
          ListTile(
            title: const Text('Diversão'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              widget.pageController.jumpToPage(2);
              Navigator.pop(context);
              setState(
                () {
                  widget.indexPage = 2;
                },
              );
            },
          ),
          ListTile(
            title: const Text('Jogos'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              widget.pageController.jumpToPage(3);
              Navigator.pop(context);
              setState(
                () {
                  widget.indexPage = 3;
                },
              );
            },
          ),
          ListTile(
            title: const Text('Amigos'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              widget.pageController.jumpToPage(4);
              Navigator.pop(context);
              setState(
                () {
                  widget.indexPage = 4;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
