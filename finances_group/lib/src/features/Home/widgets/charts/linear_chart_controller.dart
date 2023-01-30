import 'dart:async';

import 'package:flutter/material.dart';

class LinearChartController extends ChangeNotifier {
  late Timer timer;
  double percentage = 0.0;
  var percentStep = 1.0 / (60);
  var frameDuration = (1000 ~/ 60);

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
