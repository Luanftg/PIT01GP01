import 'package:flutter/material.dart';

class CustomIconButtonVisibility extends StatefulWidget {
  const CustomIconButtonVisibility({super.key});

  @override
  State<CustomIconButtonVisibility> createState() =>
      _CustomIconButtonVisibilityState();
}

class _CustomIconButtonVisibilityState
    extends State<CustomIconButtonVisibility> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        setState(() {
          isObscure = !isObscure;
        });
      }),
      icon: isObscure
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
    );
  }
}
