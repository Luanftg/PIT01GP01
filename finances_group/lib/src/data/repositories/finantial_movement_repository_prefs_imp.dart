import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/data/services/prefs_service.dart';
import 'package:finances_group/src/models/user_model.dart';

import '../../models/finantial_movement.dart';

class FinantialMovementRepositoryPrefsImp
    implements IRepository<FinantialMovement> {
  @override
  Future<bool> create(value, UserModel userModel) async {
    var response = await PrefsService.save(value, userModel);
    return response ? true : false;
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<FinantialMovement>> findAll(UserModel userLogged) async {
    // var result = await PrefsService.readFile();
    // log('result: $result');

    // if (result.isNotEmpty) {
    //   var decodedList = List.from(jsonDecode(result)).toList();
    //   log('decodedList: $decodedList');

    // var userList = decodedList.map((e) => UserModel.fromJson(e));
    // log('userList: ${userList.toString()}');
    List<FinantialMovement>? response;
    if (userLogged.finantialMovementList == null) {
      userLogged.finantialMovementList = [];
      return [];
    } else {
      response = userLogged.finantialMovementList!;
    }

    //     list.map((e) => FinantialMovement.fromMap(jsonDecode(e))).toList();
    // log('response: $response');
    return response;
  }
  //return [];

  @override
  Future<FinantialMovement> findOne(int id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }
}
