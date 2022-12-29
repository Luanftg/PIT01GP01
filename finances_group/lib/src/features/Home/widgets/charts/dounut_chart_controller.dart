import 'dart:async';

import 'package:flutter/cupertino.dart';

class DonutChartController extends ChangeNotifier {
  double fullAngle = 0;

  double secondsToComplete = 5;

  late Timer timer;

  void incrementFullAngle() {
    Timer.periodic(const Duration(milliseconds: 1000 ~/ 60), (timer) {
      fullAngle += 360 / (secondsToComplete * 1000 ~/ 60);
      if (fullAngle >= 360) {
        fullAngle = 360;
        timer.cancel();
      }
      notifyListeners();
    });
  }
}
