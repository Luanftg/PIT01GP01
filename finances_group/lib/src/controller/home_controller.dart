import 'dart:developer';

import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/data_item.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/models/user_model.dart';

class HomeController {
  final IRepository<FinantialMovement> _finantialMovementRepositoryLocalImp;
  HomeController(this._finantialMovementRepositoryLocalImp);

  double maxValue = 0;
  Future<bool> create(
      FinantialMovement finantialMovement, UserModel userModel) async {
    var result = await _finantialMovementRepositoryLocalImp.create(
        finantialMovement, userModel);
    return result ? true : false;
  }

  Future<List<FinantialMovement>> findAll(UserModel userModel) async {
    var result = await _finantialMovementRepositoryLocalImp.findAll(userModel);
    return result;
  }

  List<DataItem>? getList(UserModel args) {
    var fmList = args.finantialMovementList;

    if (fmList != null) {
      for (var index = 0; index < fmList.length; index++) {
        maxValue += fmList[index].value;
        log((fmList[index].value / maxValue).toString());
      }
      log('UserfmList: $fmList');

      var dataset = List.generate(
        fmList.length,
        (index) => DataItem(
            value: fmList![index].value / maxValue,
            label: fmList[index].category.label,
            color: fmList[index].category.color),
      );

      return dataset;
    }

    fmList = [];
    return [];
  }

  List<double>? getWeekdata(UserModel args) {
    var fmList = args.finantialMovementList;

    if (fmList != null) {
      var weekdata =
          List.generate(fmList.length, (index) => fmList[index].value);
      return weekdata;
    }
    args.finantialMovementList = [];
    return [];
  }
}
