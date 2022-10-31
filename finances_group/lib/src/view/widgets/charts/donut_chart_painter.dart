import 'dart:math';

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
  final List<DataItem> dataset;
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
    for (var element in dataset) {
      final sweepAngle = element.value * fullAngle * pi / 180;
      drawSector(element, canvas, rect, startAngle, sweepAngle);
      drawLabels(canvas, center, radius, startAngle, sweepAngle, element.label,
          incrementX, element);
      incrementX += 70;
      startAngle += sweepAngle;
    }
    drawTextCentered(canvas, center, 'Saldo geral\nR\$ 1.000,00', midTextStyle,
        radius * 0.6, (Size size) {});
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
    final dx = -newRadius + 15 + incrementX;
    final dy = newRadius + 15 + 20;
    final position = center + Offset(dx, dy);

    drawTextCentered(canvas, position, label, labelStyle, 100, (Size size) {
      final rect = Rect.fromCenter(
          center: position, width: size.width + 5, height: size.height + 5);
      final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(5));
      canvas.drawRRect(rrect, midPaint(element.color));
    });
  }

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
