import 'dart:convert';
import 'dart:developer';

import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/data/services/path_provider_service.dart';

import '../../models/finantial_movement.dart';
import '../../models/user_model.dart';

class FinantialMovementRepositoryLocalImp
    implements IRepository<FinantialMovement> {
  @override
  Future<bool> create(
      FinantialMovement finantialMovement, UserModel userModel) async {
    var response =
        await PathProviderService.writeFinantialMovement(finantialMovement);
    var result = await response.exists() ? true : false;
    return result ? true : false;
  }

  @override
  Future<bool> delete(
    int id,
  ) async {
    // TODO: implement delete
    throw UnimplementedError();
    // var resultList = await findAll();
    // var finantialmovementItem = resultList.removeAt(id);
    // return finantialmovementItem.id == id ? true : false;
  }

  @override
  Future<List<FinantialMovement>> findAll(UserModel userModel) async {
    var result = await PathProviderService.readFile();
    log('result: $result');

    if (result.contains('FileSystemException')) {
      return [];
    }
    var list = List.from(jsonDecode(result)).toList();
    log('list: $list');

    var response = list.map((e) => FinantialMovement.fromMap(e)).toList();
    return response;
  }

  @override
  Future<FinantialMovement> findOne(int id) async {
    var result = await PathProviderService.readFile();
    log('result: $result');

    var list = List.from(jsonDecode(result));
    log('list: $list');

    var mapedList = list.map((e) => FinantialMovement.fromMap(e)).toList();
    var response = mapedList.where((element) => element.id == id).first;
    return response;
  }
}
