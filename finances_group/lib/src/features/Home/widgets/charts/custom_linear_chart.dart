import 'package:finances_group/src/features/home/widgets/charts/linear_chart_controller.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:flutter/material.dart';

import 'custom_linear_chart_painter.dart';

class CustomLinearChart extends StatefulWidget {
  final List<FinantialMovement>? weekData;
  const CustomLinearChart({required this.weekData, super.key});

  @override
  State<CustomLinearChart> createState() => _CustomLinearChartState();
}

class _CustomLinearChartState extends State<CustomLinearChart> {
  var controller = LinearChartController();
  double get percentage => controller.percentage;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.incrementPercentage();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: CustomPaint(
        painter: CustomLinearChartPainter(
          percentage,
          widget.weekData ?? [],
        ),
      ),
    );
  }
}
