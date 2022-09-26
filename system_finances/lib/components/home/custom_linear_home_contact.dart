import 'package:flutter/material.dart';

import 'custom_circular_contact_image.dart';

class CustomLinearContactWidget extends StatelessWidget {
  final String pathContactImage;
  final String contactName;
  const CustomLinearContactWidget(
      {Key? key, required this.pathContactImage, required this.contactName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomCircularContactImage(
              pathContactImage: pathContactImage,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Olá !',
                  style: TextStyle(color: Colors.white54),
                ),
                Text(
                  contactName,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black54,
                  blurRadius: 20,
                  offset: Offset.zero,
                )
              ],
            )),
      ],
    );
  }
}
