import 'dart:math';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/data_item.dart';

final linePaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 2.0
  ..color = Colors.white;

Paint midPaint(Color color) => Paint()
  ..style = PaintingStyle.fill
  ..color = color;

const midTextStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
);

final labelStyle = TextStyle(
  color: Colors.black,
  fontSize: 13.0,
  fontFamily: GoogleFonts.sourceSansPro().fontFamily,
);

class DonutChartPainter extends CustomPainter {
  final List<FinantialMovement>? dataset;
  final double fullAngle;
  DonutChartPainter(this.dataset, this.fullAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 4);
    final radius = size.width * 0.8;
    final rect = Rect.fromCenter(
        center: center, width: radius * 0.8, height: radius * 0.8);

    var startAngle = 0.0;
    canvas.drawArc(rect, startAngle, fullAngle * pi / 180, false, linePaint);
    double incrementX = 10;
    double sum = 0.0;
    List<DataItem>? dataList = [];

    if (dataset != null) {
      for (var index = 0; index < dataset!.length; index++) {
        sum += dataset![index].value;
      }
      dataList = List.generate(
        dataset!.length,
        (index) => DataItem(
            value: dataset![index].value / sum,
            label: dataset![index].category.label,
            color: dataset![index].category.color),
      );
    }

    for (var element in dataList) {
      final sweepAngle = element.value * fullAngle * pi / 180;
      drawSector(element, canvas, rect, startAngle, sweepAngle);
      drawLabels(canvas, center, radius, startAngle, sweepAngle, element.label,
          incrementX, element);
      incrementX += 70;
      startAngle += sweepAngle;
    }
    drawTextCentered(
        canvas,
        center,
        'Saldo geral\nR\$ ${sum.toStringAsFixed(2)}',
        midTextStyle,
        radius * 0.6,
        (Size size) {});
  }

  void drawSector(DataItem element, Canvas canvas, Rect rect, double startAngle,
      double sweepAngle) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..color = element.color;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  void drawLabels(
      Canvas canvas,
      Offset center,
      double radius,
      double startAngle,
      double sweepAngle,
      String label,
      double incrementX,
      DataItem element) {
    final newRadius = radius * 0.4;
    final dx = -radius * 0.55 + incrementX * 0.8;
    final dy = newRadius + 35;
    // double dx = -180 + incrementX * 0.8;

    final position = center + Offset(dx, dy);

    drawTextCentered(canvas, position, label, labelStyle, 100, (Size size) {
      final rect = Rect.fromCenter(
          center: position, width: size.width + 2, height: size.height + 5);
      final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(5));
      canvas.drawRRect(rrect, midPaint(element.color));
    });
  }

  void drawLabels2(
    Canvas canvas,
    Offset startPosition,
    double spaceBetween,
    DataItem element,
  ) {}

  TextPainter measureText(
      String text, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    textPainter.layout(maxWidth: maxWidth, minWidth: 0);
    return textPainter;
  }

  Size drawTextCentered(Canvas canvas, Offset position, String text,
      TextStyle style, double maxWidth, Function(Size size) bgCb) {
    final textPainter = measureText(text, style, maxWidth, TextAlign.center);
    final pos =
        position + Offset(-textPainter.width / 2, -textPainter.height / 2);
    bgCb(textPainter.size);
    textPainter.paint(canvas, pos);
    return textPainter.size;
  }

  void drawLine(
      double radius, double startAngle, Offset center, Canvas canvas) {
    final dx = radius / 2 * cos(startAngle);
    final dy = radius / 2 * sin(startAngle);
    final p2 = center + Offset(dx, dy);
    canvas.drawLine(center, p2, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
