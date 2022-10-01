import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:system_finances/models/user_model.dart';
import 'package:system_finances/repositories/login_repository.dart';
import 'package:system_finances/services/prefs_services.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  final LoginRepository _loginRepository;
  ValueNotifier<List<UserModel>> users = ValueNotifier<List<UserModel>>([]);

  String? _login;

  LoginController(this._loginRepository);
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    inLoader.value = true;
    users.value = await _loginRepository.getUser();

    log('${users.value}');

    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;

    if (_login == 'luanftg' && _pass == '123') {
      PrefsService.save(_login!);
      return true;
    }

    return false;
  }
}
