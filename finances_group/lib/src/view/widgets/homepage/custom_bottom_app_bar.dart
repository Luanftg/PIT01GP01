import 'package:finances_group/src/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;
  static final List<FloatingActionButtonLocation> centerLocations = [
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];
  const CustomBottomAppBar({
    super.key,
    required this.fabLocation,
    this.shape = const CircularNotchedRectangle(),
  });

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
            onPressed: () {},
            icon: const Icon(Icons.monetization_on),
            tooltip: 'Estatísticas',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            tooltip: 'Configurações',
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
