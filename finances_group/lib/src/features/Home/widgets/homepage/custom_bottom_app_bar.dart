import 'package:flutter/material.dart';

import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  final FloatingActionButtonLocation fabLocation;
  final UserModel userModel;
  final NotchedShape? shape;
  static final List<FloatingActionButtonLocation> centerLocations = [
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];
  const CustomBottomAppBar({
    Key? key,
    required this.fabLocation,
    required this.userModel,
    this.shape = const CircularNotchedRectangle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppCustomColors.darkSecondary,
      shape: shape,
      child: Row(
        children: [
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
            tooltip: 'Abre o menu de navegação',
          ),
          if (centerLocations.contains(fabLocation)) const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/simulator');
            },
            icon: const Icon(Icons.monetization_on),
            tooltip: 'Investimentos',
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/user-profile', arguments: userModel);
            },
            icon: const Icon(Icons.settings),
            tooltip: 'Configurações',
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
