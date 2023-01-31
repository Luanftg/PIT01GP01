// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/shared/design/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final UserModel userModel;
  const CustomDrawer({super.key, required this.userModel});
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration:
                const BoxDecoration(color: AppCustomColors.darkSecondary),
            accountName: Text(widget.userModel.name,
                style: CustomAppTextTheme.headline2),
            accountEmail: Text(
              widget.userModel.email,
              style: CustomAppTextTheme.body,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: widget.userModel.photoURL?.isEmpty ?? true
                    ? Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
                        fit: BoxFit.fitWidth,
                        width: width * 0.4,
                      )
                    : Image.file(
                        File(widget.userModel.photoURL ?? ''),
                        fit: BoxFit.fitWidth,
                        width: width * 0.4,
                      ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Boas Vindas',
              style: CustomAppTextTheme.body,
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/on-boarding', arguments: widget.userModel);
            },
          ),
          ListTile(
            title: Text('Investimentos', style: CustomAppTextTheme.body),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pushNamed('/simulator');
            },
          ),
          ListTile(
            title: Text('Configurações', style: CustomAppTextTheme.body),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/user-profile', arguments: widget.userModel);
            },
          ),
        ],
      ),
    );
  }
}
