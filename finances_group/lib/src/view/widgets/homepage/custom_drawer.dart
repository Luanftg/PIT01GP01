// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/design/theme/text_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget {
  final String userImage;
  final String userName;
  final String userEmail;
  const CustomDrawer(
      {super.key,
      required this.userImage,
      required this.userName,
      required this.userEmail});
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
            accountName:
                Text(widget.userName, style: CustomAppTextTheme.headline2),
            accountEmail: Text(
              widget.userEmail,
              style: CustomAppTextTheme.body,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  widget.userImage,
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
