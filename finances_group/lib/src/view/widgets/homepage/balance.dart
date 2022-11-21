import 'package:finances_group/src/data/fake_db.dart';
import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/design/theme/text_theme.dart';

import 'package:flutter/material.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: const BoxDecoration(
              color: AppCustomColors.darkSecondary,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo geral',
                      style: CustomAppTextTheme.body,
                    ),
                    Text(
                        'R\$ ${users[0].balance.toStringAsFixed(2).replaceFirst('.', ',')}',
                        style: CustomAppTextTheme.headline2.copyWith(
                            color: AppCustomColors.foreGround,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                  onPressed: () => debugPrint('Visibily Icon'),
                  icon: const Icon(Icons.visibility),
                  color: AppCustomColors.foreGround,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
