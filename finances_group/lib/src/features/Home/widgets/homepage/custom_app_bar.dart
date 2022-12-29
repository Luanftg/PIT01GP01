import 'package:finances_group/src/features/Home/widgets/homepage/action_app_bar.dart';
import 'package:finances_group/src/features/home/widgets/homepage/title_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../models/user_model.dart';

class CustomAppBar extends StatelessWidget {
  final String? userName;
  final String? userImage;
  final UserModel? userLogged;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.userImage,
    this.userLogged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 75,
      title: TitleAppBar(userImage: userLogged!.photoURL, userName: userName),
      actions: [
        ActionAppBar(
          userLogged: userLogged,
        )
      ],
      automaticallyImplyLeading: false,
    );
  }
}
