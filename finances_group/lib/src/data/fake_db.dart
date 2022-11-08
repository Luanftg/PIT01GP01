import 'dart:math';

import '../models/data_item.dart';
import '../view/design/colors/app_custom_colors.dart';

final List<DataItem> dataset = [
  DataItem(value: 0.3, label: 'Casa', color: AppCustomColors.cyan),
  DataItem(value: 0.2, label: 'Transporte', color: AppCustomColors.danger),
  DataItem(value: 0.4, label: 'Estudos', color: AppCustomColors.primary),
  DataItem(value: 0.1, label: 'Outros', color: AppCustomColors.secondary),
];

var random = Random();

var weekData = List<double>.generate(
  100,
  (index) => random.nextDouble() * 100.0,
);
