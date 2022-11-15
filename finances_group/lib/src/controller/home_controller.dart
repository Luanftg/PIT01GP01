import 'package:finances_group/src/data/fake_db.dart';
import 'package:finances_group/src/data/repositories/finantial_movement_repository_local_imp.dart';
import 'package:finances_group/src/models/data_item.dart';
import 'package:finances_group/src/models/finantial_movement.dart';

class HomeController {
  final FinantialMovementRepositoryLocalImp  _finantialMovementRepositoryLocalImp;
  HomeController(this._finantialMovementRepositoryLocalImp);

  Future<bool> create(FinantialMovement finantialMovement) async {
    var result =
        await _finantialMovementRepositoryLocalImp.create(finantialMovement);
    return result ? true : false;
  }

  Future<List<FinantialMovement>> findAll() async {
    var result = await _finantialMovementRepositoryLocalImp.findAll();
    return result;
  }

  List<DataItem> getList() => dataset;
  //List<DataItem> getList() => List.;

  List<double> getWeekdata() => weekData;
}
