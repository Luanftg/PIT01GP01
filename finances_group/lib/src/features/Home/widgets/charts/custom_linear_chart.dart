import 'dart:async';

import 'package:finances_group/src/features/home/widgets/charts/liner_chart_controller.dart';
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
  double get minData => controller.minData;
  double get rangeData => controller.rangeData;
  double get maxData => controller.maxData;
  double get percentage => controller.percentage;

  var controller = LinearChartController();
  List<double> get listOfDouble => controller.doubleList;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.incrementPercentage();
    controller.getList(widget.weekData);
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
          listOfDouble,
          minData,
          maxData,
          rangeData,
          percentage,
        ),
      ),
    );
  }
}
