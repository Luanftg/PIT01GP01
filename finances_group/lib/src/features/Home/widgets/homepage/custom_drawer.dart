// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration:
                const BoxDecoration(color: AppCustomColors.darkSecondary),
            accountName: Text(widget.userModel.name ?? '',
                style: CustomAppTextTheme.headline2),
            accountEmail: Text(
              widget.userModel.email ?? '',
              style: CustomAppTextTheme.body,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  widget.userModel.photoURL?.isEmpty ?? true
                      ? "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg"
                      : widget.userModel.photoURL ?? '',
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Principal',
              style: CustomAppTextTheme.body,
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          ListTile(
            title: Text('Investimentos', style: CustomAppTextTheme.body),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
          ListTile(
            title: Text('Configurações', style: CustomAppTextTheme.body),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
