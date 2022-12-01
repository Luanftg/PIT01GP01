import 'dart:convert';

import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/states/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<LoginState> logar(UserModel user) async {
    LoginState state = LoginStateLoading();
    final prefs = await SharedPreferences.getInstance();

    final List<String>? users = prefs.getStringList('user1');

    if (users != null) {
      final decodedList = users.map((e) => jsonDecode(e)).toList();

      final mapedList =
          decodedList.map((e) => UserModel.fromJson((e))).toList();

      try {
        final UserModel userFromShared = mapedList.firstWhere(
          (element) =>
              element.email == user.email && element.password == user.password,
        );
        userFromShared.isLogged = true;

        final userListToSave = mapedList.map((e) => jsonEncode(e)).toList();
        await prefs.setStringList('user1', userListToSave);

        state = LoginStateSucces(userFromShared);
        return state;
      } catch (e) {
        state = LoginStateError('Credenciais inválidas');
        return state;
      }
    }
    state = LoginStateError('Credenciais inválidas');
    return state;
  }

  void logout(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? users = prefs.getStringList('user1');
    final decodedList = users!.map((e) => jsonDecode(e)).toList();
    final mapedList = decodedList.map((e) => UserModel.fromJson((e))).toList();
    final UserModel userFromShared = mapedList.firstWhere(
      (element) =>
          element.email == userModel.email &&
          element.password == userModel.password,
    );
    userFromShared.isLogged = false;
    final userListToSave = mapedList.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList('user1', userListToSave);
  }
}
