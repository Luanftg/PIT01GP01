import 'dart:convert';
import 'dart:developer';

import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/data/services/prefs_service.dart';

import '../../models/finantial_movement.dart';

class FinantialMovementRepositoryPrefsImp
    implements IRepository<FinantialMovement> {
  @override
  Future<bool> create(value) async {
    var response = await PrefsService.save(value.toJson());
    return response ? true : false;
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<FinantialMovement>> findAll() async {
    var result = await PrefsService.readFile();
    log('result: $result');

    if (result.isNotEmpty) {
      var list = List.from(jsonDecode(result)).toList();
      log('list: $list');
      var response = list.map((e) => FinantialMovement.fromJson(e)).toList();
      log('response: $response');
      return response;
    }
    return [];
  }

  @override
  Future<FinantialMovement> findOne(int id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }
}
