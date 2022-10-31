// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/design/theme/text_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});
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
                Text('Nicolas Kormann', style: CustomAppTextTheme.headline2),
            accountEmail: Text(
              'nicolaskormann@gmail.com',
              style: CustomAppTextTheme.body,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                    'https://media-exp1.licdn.com/dms/image/C4D03AQEoqxz5Ur8xIw/profile-displayphoto-shrink_200_200/0/1661958896044?e=1671667200&v=beta&t=s1ikt5EvvbLEXcHOjrah9mVcUDrlahFACjBjH3C5TS8'),
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
