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
      shape: shape,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home_filled),
            tooltip: 'Abre o menu de navegação',
          ),
          if (centerLocations.contains(fabLocation)) const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            tooltip: 'Busca',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.monetization_on),
            tooltip: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
