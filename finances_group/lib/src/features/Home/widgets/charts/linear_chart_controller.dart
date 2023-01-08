import 'dart:async';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:flutter/material.dart';

class LinearChartController extends ChangeNotifier {
  late Timer timer;
  double minData = double.maxFinite;
  double rangeData = 1.0;
  double maxData = -double.maxFinite;
  double percentage = 0.0;
  List<double> doubleList = [];

  var percentStep = 1.0 / (60);

  var frameDuration = (1000 ~/ 60);

  void getList(List<FinantialMovement>? weekdata) {
    if (weekdata != null && weekdata.isNotEmpty) {
      for (int index = 0; index < weekdata.length; index++) {
        doubleList.add(weekdata[index].value);
      }

      doubleList = doubleList.take(7).toList();

      for (var element in doubleList) {
        minData = element < minData ? element : minData;
        maxData = element > maxData ? element : maxData;
      }
      rangeData = maxData - minData;
      if (rangeData == 0) {
        rangeData = minData;
        minData = 0.0;
      }
    } else {
      rangeData = 0;
      minData = 0;
      maxData = 0;
    }
  }

  void incrementPercentage() {
    timer = Timer.periodic(Duration(milliseconds: frameDuration), (timer) {
      percentage += percentStep;
      percentage = percentage > 1.0 ? 1.0 : percentage;
      if (percentage >= 1.0) {
        timer.cancel();
      }
      notifyListeners();
    });
  }
}
