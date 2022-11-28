// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';

import '../../../models/data_item.dart';
import 'donut_chart_painter.dart';

class DonutChartWidget extends StatefulWidget {
  final List<DataItem>? dataset;
  const DonutChartWidget({super.key, required this.dataset});

  @override
  State<DonutChartWidget> createState() => _DonutChartWidgetState();
}

class _DonutChartWidgetState extends State<DonutChartWidget> {
  late Timer timer;
  double fullAngle = 0.0;
  double secondsToComplete = 5;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1000 ~/ 60), (timer) {
      setState(() {
        fullAngle += 360 / (secondsToComplete * 1000 ~/ 60);
        if (fullAngle >= 360) {
          fullAngle = 360;
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
    return Container(
      color: Colors.grey,
      child: CustomPaint(
        painter: DonutChartPainter(widget.dataset, fullAngle),
        child: Container(),
      ),
    );
  }
}
