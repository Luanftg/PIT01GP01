import 'package:finances_group/src/data/repositories/repository.dart';

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

  List<FinantialMovement>? getList(UserModel args) {
    return args.finantialMovementList;
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
