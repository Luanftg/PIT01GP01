import 'package:finances_group/src/features/home/widgets/charts/dounut_chart_controller.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

import 'donut_chart_painter.dart';

class DonutChartWidget extends StatefulWidget {
  final List<FinantialMovement>? dataset;
  const DonutChartWidget({
    super.key,
    this.dataset,
  });

  @override
  State<DonutChartWidget> createState() => _DonutChartWidgetState();
}

class _DonutChartWidgetState extends State<DonutChartWidget> {
  var controller = DonutChartController();
  double get _fullAngle => controller.fullAngle;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controller.incrementFullAngle();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppCustomColors.grey,
      child: CustomPaint(
        painter: DonutChartPainter(widget.dataset, _fullAngle),
        child: Container(),
      ),
    );
  }
}
