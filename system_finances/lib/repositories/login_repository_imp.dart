import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:system_finances/models/user_model.dart';
import 'package:system_finances/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  @override
  Future<List<UserModel>> getUser() async {
    try {
      var response = await Dio()
          .get('https://luanftg.github.io/teste-git/finances_api.json');
      final user =
          (response.data as List).map((e) => UserModel.fromJson(e)).toList();
      return user;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
