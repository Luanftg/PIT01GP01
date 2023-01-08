import 'package:finances_group/src/features/home/widgets/homepage/action_app_bar.dart';
import 'package:finances_group/src/features/home/widgets/homepage/title_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../models/user_model.dart';

class CustomAppBar extends StatelessWidget {
  final UserModel userLogged;

  const CustomAppBar({
    super.key,
    required this.userLogged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 75,
      title: TitleAppBar(
          userImage: userLogged.photoURL, userName: userLogged.name),
      actions: [
        ActionAppBar(
          userLogged: userLogged,
        )
      ],
      automaticallyImplyLeading: false,
    );
  }
}
