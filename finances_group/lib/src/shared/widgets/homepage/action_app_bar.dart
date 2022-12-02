import 'package:finances_group/src/features/Login/login_controller.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

import '../../../models/user_model.dart';

class ActionAppBar extends StatelessWidget {
  final UserModel? userLogged;
  const ActionAppBar({
    Key? key,
    required this.userLogged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
              color: AppCustomColors.darkSecondary,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: IconButton(
            onPressed: () => debugPrint('Notification Icon'),
            icon: const Icon(Icons.notifications),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
              onPressed: () {
                controller.logout(userLogged!);
                Navigator.of(context).pushReplacementNamed('/login');
              },
              icon: const Icon(Icons.logout)),
        ),
      ],
    );
  }
}
