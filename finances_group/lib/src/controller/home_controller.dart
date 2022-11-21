import 'dart:developer';

import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/data_item.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:flutter/material.dart';

class HomeController {
  final IRepository<FinantialMovement> _finantialMovementRepositoryLocalImp;
  HomeController(this._finantialMovementRepositoryLocalImp);

  double maxValue = 0;
  Future<bool> create(FinantialMovement finantialMovement) async {
    var result =
        await _finantialMovementRepositoryLocalImp.create(finantialMovement);
    return result ? true : false;
  }

  Future<List<FinantialMovement>> findAll() async {
    var result = await _finantialMovementRepositoryLocalImp.findAll();
    return result;
  }

  List<DataItem>? getList(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as List<FinantialMovement>;
    var fmList = args;
    for (var index = 0; index < fmList.length; index++) {
      maxValue += fmList[index].value;
      log((fmList[index].value / maxValue).toString());
    }
    log('UserfmList: $fmList');
    var dataset = List.generate(
      fmList.length,
      (index) => DataItem(
          value: fmList[index].value / maxValue,
          label: fmList[index].category.label,
          color: fmList[index].category.color),
    );

    return dataset;
  }

  List<double>? getWeekdata(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as List<FinantialMovement>;

    var fmList = args;

    var weekdata = List.generate(fmList.length, (index) => fmList[index].value);

    return weekdata;
  }
}
