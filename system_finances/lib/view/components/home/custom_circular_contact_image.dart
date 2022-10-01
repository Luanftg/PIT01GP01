import 'package:flutter/material.dart';

class CustomCircularContactImage extends StatelessWidget {
  final String pathContactImage;
  const CustomCircularContactImage({
    Key? key,
    required this.pathContactImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
        image: DecorationImage(
          image: NetworkImage(pathContactImage),
        ),
      ),
    );
  }
}
