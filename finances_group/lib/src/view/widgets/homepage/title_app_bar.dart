import 'package:finances_group/src/view/design/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../data/mock_db.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => {Scaffold.of(context).openDrawer()},
            child: CircleAvatar(
              backgroundImage: NetworkImage(users[0].photoURL ??
                  'https://www.nicepng.com/png/full/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png'),
              radius: 24,
            ),
          ),
        ),
        Text(
          users[0].displayName!,
          style: CustomAppTextTheme.body.copyWith(
            fontSize: 18,
          ),
          //style: FinanceTextStyles.headlineLarge,
        ),
      ],
    );
  }
}
