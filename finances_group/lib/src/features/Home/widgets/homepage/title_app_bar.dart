import 'package:finances_group/src/shared/design/theme/text_theme.dart';

import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  final String? userName;
  final String? userImage;
  const TitleAppBar({
    Key? key,
    required this.userName,
    required this.userImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
              onTap: () => {Scaffold.of(context).openDrawer()},
              child:
                  //userImage != null
                  CircleAvatar(
                backgroundImage: NetworkImage(
                  userImage!.isNotEmpty ?
                      userImage! : 'https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg',
                ),
                radius: 24,
              )
              // : const CircleAvatar(
              //     backgroundImage: NetworkImage(
              //         'https://upload.wikimedia.org/wikipedia/commons/b/bc/Unknown_person.jpg'),
              //     radius: 24,
              //   ),
              ),
        ),
        Text(
          userName ?? 'User Without Name',
          style: CustomAppTextTheme.body.copyWith(
            fontSize: 18,
          ),
          //style: FinanceTextStyles.headlineLarge,
        ),
      ],
    );
  }
}
