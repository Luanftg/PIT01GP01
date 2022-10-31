import 'dart:async';

import 'package:flutter/material.dart';

import 'custom_linear_chart_painter.dart';

class CustomLinearChart extends StatefulWidget {
  final List<double> weekData;
  const CustomLinearChart({required this.weekData, super.key});

  @override
  State<CustomLinearChart> createState() => _CustomLinearChartState();
}

class _CustomLinearChartState extends State<CustomLinearChart> {
  late List<double> weekData;
  double minData = double.maxFinite;
  double rangeData = 1.0;
  double maxData = -double.maxFinite;
  double percentage = 0.0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    setState(() {
      weekData = widget.weekData.take(7).toList();
      for (var element in weekData) {
        minData = element < minData ? element : minData;
        maxData = element > maxData ? element : maxData;
      }
      rangeData = maxData - minData;
    });

    //setup animation timer and update variables
    const fps = 60.0;
    const totalAnimation = 1.0;
    var percentStep = 1.0 / (totalAnimation * fps);
    var frameDuration = (1000 ~/ fps);
    timer = Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
      setState(() {
        percentage += percentStep;
        percentage = percentage > 1.0 ? 1.0 : percentage;
        if (percentage >= 1.0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: CustomPaint(
        painter: CustomLinearChartPainter(
          weekData,
          minData,
          maxData,
          rangeData,
          percentage,
        ),
      ),
    );
  }
}
