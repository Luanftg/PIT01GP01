import 'dart:developer';

import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/states/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<LoginState> logar(UserModel user) async {
    LoginState state = LoginStateLoading();
    final prefs = await SharedPreferences.getInstance();

    final String? email = prefs.getString('email');
    final String? password = prefs.getString('password');

    log(email!);
    log(password!);

    await Future.delayed(const Duration(milliseconds: 500));

    if (email == user.email && password == user.password) {
      state = LoginStateSucces();
      return state;
    }
    state = LoginStateError('Credenciais inválidas');
    return state;
  }
}
