import 'package:flutter/material.dart';

class CustomMiniFABComponent extends StatelessWidget {
  const CustomMiniFABComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      mini: true,
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
