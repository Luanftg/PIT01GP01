import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:system_finances/models/user_model.dart';
import 'package:system_finances/repositories/home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<List<UserModel>> getList() async {
    var value = await rootBundle.loadString('assets/data.json');
    List userJson = jsonDecode(value);
    return userJson.map((e) => UserModel.fromJson(e)).toList();
  }
}
