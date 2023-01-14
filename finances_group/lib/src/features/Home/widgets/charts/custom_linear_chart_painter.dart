import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

class CustomLinearChartPainter extends CustomPainter {
  final List<double>? weekData;
  final double minData;
  final double maxData;
  final double rangeData;
  double percentage;
  CustomLinearChartPainter(
    this.weekData,
    this.minData,
    this.maxData,
    this.rangeData,
    this.percentage,
  );

  var chartWidth = 350.0;
  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    drawChart(canvas, center);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void drawFrame(Canvas canvas, Offset center) {
    var rect =
        Rect.fromCenter(center: center, width: chartWidth, height: chartWidth);
    //fill rect
    var bgPaint = Paint()..color = const Color(0xfff2f3f0);
    canvas.drawRect(rect, bgPaint);

    //draw border
    var border = Paint()
      ..color = Colors.black45
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rect, border);
  }

  var chartW = 300.0;
  var chartH = 100.0;

  void drawChart(Canvas canvas, Offset center) {
    var rect = Rect.fromCenter(center: center, width: chartW, height: chartH);
    var chartBorderPaint = Paint()
      ..color = AppCustomColors.grayLight
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;
    var dpPaint = Paint()
      ..color = AppCustomColors.secondary
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    var titleStyle = const TextStyle(
      color: AppCustomColors.foreGround,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    );
    var labelStyle = const TextStyle(
      color: AppCustomColors.foreGround,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    );

    drawBorder(canvas, rect, chartBorderPaint);
    drawDataPoints(canvas, dpPaint, rect);
    drawGuides(canvas, chartBorderPaint, rect);
    drawText(canvas, rect.topLeft + const Offset(0, -50), rect.width,
        titleStyle, "Movimentações");
    drawLabels(canvas, rect, labelStyle);
  }

  void drawBorder(Canvas canvas, Rect rect, Paint chartBorderPaint) {
    canvas.drawRect(rect, chartBorderPaint);
  }

  void drawGuides(Canvas canvas, Paint chartBorderPaint, Rect rect) {
    var x = rect.left;
    var columW = chartW / 6;

    for (var i = 0; i < 7; i++) {
      var p1 = Offset(x, rect.bottom);
      var p2 = Offset(x, rect.top);
      canvas.drawLine(p1, p2, chartBorderPaint);
      x += columW;
    }

    var yD = chartH / 3.0;
    canvas.drawLine(
      Offset(rect.left, rect.bottom - yD),
      Offset(rect.right, rect.bottom - yD),
      chartBorderPaint,
    );
    canvas.drawLine(
      Offset(rect.left, rect.bottom - yD * 2),
      Offset(rect.right, rect.bottom - yD * 2),
      chartBorderPaint,
    );
  }

  void drawDataPoints(Canvas canvas, Paint dpPaint, Rect rect) {
    if (weekData == null) return;
    var startX = rect.left;
    var startY = rect.bottom;
    // the radio is the number of y pixels per unit data
    var yRatio = chartH / rangeData;
    var columW = chartW / 6.0;
    var path = Path();
    path.moveTo(startX, startY);
    var x = rect.left;
    bool first = true;
    for (var element in weekData!) {
      var y = (element - minData) * yRatio * percentage;
      if (first) {
        path.moveTo(x, rect.bottom - y);
        first = false;
      } else {
        path.lineTo(x, rect.bottom - y);
      }
      x += columW;
    }

    //close Path
    path.moveTo(x - columW, rect.bottom);
    path.moveTo(rect.left, rect.bottom);

    canvas.drawPath(path, dpPaint);
  }

  void drawText(Canvas canvas, Offset position, double width,
      TextStyle titleStyle, String text) {
    final textSpan = TextSpan(text: text, style: titleStyle);
    final textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: width);
    textPainter.paint(canvas, position);
  }

  void drawLabels(Canvas canvas, Rect rect, TextStyle labelStyle) {
    final xLabel = ["1", "2", "3", "4", "5", "6", "7"];
    var columW = chartW / 6.0;
    // draw x Label
    var x = rect.left;
    for (var i = 0; i < 7; i++) {
      drawText(canvas, Offset(x, rect.bottom + 15), 15, labelStyle, xLabel[i]);
      x += columW;
    }

    //draw y Label
    drawText(canvas, rect.bottomLeft + const Offset(-25, 0), 35, labelStyle,
        minData.toStringAsFixed(1));
    drawText(canvas, rect.topLeft + const Offset(-25, 0), 35, labelStyle,
        maxData.toStringAsFixed(1));
  }
}
