import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/shared/design/theme/text_theme.dart';
import 'package:finances_group/src/shared/widgets/custom_icon_buttom_visibility.dart';
import 'package:flutter/material.dart';

class CustomCardHomeWidget extends StatelessWidget {
  final UserModel? user;

  const CustomCardHomeWidget({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppCustomColors.darkSecondary,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: AppCustomColors.foreGround,
            offset: Offset.zero,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 8,
                      color: AppCustomColors.primary,
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo geral',
                            style: CustomAppTextTheme.body,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'R\$ ${'0.00'}',
                            style: CustomAppTextTheme.textMoney,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: CustomIconButtonVisibility(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
