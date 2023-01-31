import 'dart:io';

import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/shared/design/theme/text_theme.dart';

import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  final UserModel userModel;
  const TitleAppBar({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => {Scaffold.of(context).openDrawer()},
            child: CircleAvatar(
              radius: 26,
              child: ClipOval(
                child: userModel.photoURL?.isEmpty ?? true
                    ? Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg",
                        fit: BoxFit.fitWidth,
                        width: width * 0.4,
                      )
                    : Image.file(
                        File(userModel.photoURL ?? ''),
                        fit: BoxFit.fitWidth,
                        width: width * 0.4,
                      ),
              ),
            ),
          ),
        ),
        Text(
          userModel.name,
          softWrap: true,
          overflow: TextOverflow.clip,
          maxLines: 2,
          textHeightBehavior: const TextHeightBehavior(),
          style: CustomAppTextTheme.body.copyWith(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
