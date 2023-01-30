import 'package:finances_group/src/features/home/widgets/charts/dounut_chart_controller.dart';
import 'package:flutter/material.dart';

class CustomIconButtonVisibility extends StatefulWidget {
  const CustomIconButtonVisibility({super.key});

  @override
  State<CustomIconButtonVisibility> createState() =>
      _CustomIconButtonVisibilityState();
}

class _CustomIconButtonVisibilityState
    extends State<CustomIconButtonVisibility> {
  bool get isObscure => DonutChartController.isObscure.value;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        setState(() {
          DonutChartController.changeIsObscure();
        });
      }),
      icon: isObscure
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
    );
  }
}
