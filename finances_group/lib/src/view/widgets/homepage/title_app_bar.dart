import 'package:finances_group/src/view/components/user.dart';
import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () => {
                  debugPrint('Image Button'),
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(users[0].photoURL ??
                      'https://www.nicepng.com/png/full/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png'),
                  radius: 32,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Olá,',
                  //style: FinanceTextStyles.caption,
                ),
                Text(
                  users[0].displayName!,
                  //style: FinanceTextStyles.headlineLarge,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}