import 'dart:math';

import 'package:finances_group/src/features/home/widgets/charts/dounut_chart_controller.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/shared/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/data_item.dart';

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
  Set<String?> listOfCategories = {};

  bool get isObscure => DonutChartController.isObscure.value;
  DonutChartPainter(this.dataset, this.fullAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 4);
    final radius = size.width * 0.8;
    final rect = Rect.fromCenter(
        center: center, width: radius * 0.8, height: radius * 0.8);

    var startAngle = 0.0;
    canvas.drawArc(rect, startAngle, fullAngle * pi / 180, false, linePaint);
    double incrementX = 25;
    double sum = 0.0;
    List<DataItem>? dataList = [];
    List<DataItem>? newList = [];
    double totalSum = 0.0;
    if (dataset != null) {
      for (var index = 0; index < dataset!.length; index++) {
        totalSum += dataset![index].value;
        if (dataset![index].isIncome == false) {
          double number = dataset![index].value;
          number = number * -1.0;
          sum += number;
        } else {
          sum += dataset![index].value;
        }
      }

      dataList = List.generate(
        dataset!.length,
        (index) => DataItem(
          value: dataset![index].value / totalSum,
          label: dataset![index].category.label,
          color: dataset![index].category.color!,
        ),
      );
    }

    listOfCategories =
        List.generate(dataList.length, (index) => dataList?[index].label)
            .toSet();

    var list = listOfCategories.toList();
    int c = 0;
    double somaCategoria = 0.0;
    for (c; c < list.length; c++) {
      for (var i = 0; i < dataList.length; i++) {
        if (dataList[i].label == list[c]) {
          somaCategoria += dataList[i].value;
        }
      }

      newList.add(DataItem(
          value: somaCategoria, label: list[c]!, color: dataList[c].color));
      somaCategoria = 0;
    }

    for (var element in newList) {
      final sweepAngle = element.value * fullAngle * pi / 180;
      drawSector(element, canvas, rect, startAngle, sweepAngle);
      drawLabels(canvas, center, radius, startAngle, sweepAngle, element.label,
          incrementX, element);
      incrementX += 70;
      startAngle += sweepAngle;
    }
    var textSum = sum < 0 ? sum * -1.0 : sum;
    drawTextCentered(
      isObscure: isObscure,
      canvas,
      center,
      'Saldo geral\nR\$ ${Currency.moneyFormat(textSum.toStringAsFixed(2))}',
      midTextStyle,
      radius * 0.6,
      (Size size) {},
    );
  }

  void drawSector(
    DataItem element,
    Canvas canvas,
    Rect rect,
    double startAngle,
    double sweepAngle,
  ) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15
      ..color = element.color;
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
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
    // final dx = -radius * 0.55 + incrementX * 0.9;
    final dy = newRadius + 35;
    // double dx = -180 + incrementX * 0.95 + 16;
    double dx = -180 + incrementX * 0.9;

    final position = center + Offset(dx, dy);

    drawTextCentered(isObscure: false, canvas, position, label, labelStyle, 100,
        (Size size) {
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
      TextStyle style, double maxWidth, Function(Size size) bgCb,
      {bool? isObscure}) {
    if (isObscure ?? false) {
      text = 'Saldo geral\nR\$ ***';
    }
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
