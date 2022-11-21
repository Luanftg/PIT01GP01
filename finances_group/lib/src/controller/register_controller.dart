import 'dart:developer';

import 'package:finances_group/src/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController {
  Future<void> register(RegisterModel user) async {
    final prefs = await SharedPreferences.getInstance();

    log(user.name!);
    log(user.email!);
    log(user.phone!);
    log(user.cpf!);
    log(user.password!);
    log(user.photoURL!);

    await prefs.setString('name', user.name!);
    await prefs.setString('email', user.email!);
    await prefs.setString('phone', user.phone!);
    await prefs.setString('cpf', user.cpf!);
    await prefs.setString('password', user.password!);
    await prefs.setString('photoURL', user.photoURL!);
  }
}
