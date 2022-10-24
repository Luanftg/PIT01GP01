import 'package:flutter/material.dart';

class ActionAppBar extends StatelessWidget {
  const ActionAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
              color: Color.fromARGB(20, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: IconButton(
            onPressed: () => debugPrint('Notification Icon'),
            icon: const Icon(Icons.notifications),
          ),
        ),
      ],
    );
  }
}