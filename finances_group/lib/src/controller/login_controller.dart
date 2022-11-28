import 'dart:convert';
import 'dart:developer';

import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/states/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<LoginState> logar(UserModel user) async {
    LoginState state = LoginStateLoading();
    final prefs = await SharedPreferences.getInstance();

    final List<String>? users = prefs.getStringList('user1');

    log('Users: $users');

    if (users != null) {
      final decodedList = users.map((e) => jsonDecode(e)).toList();
      log('DecodedList: $decodedList');
      //final list = List.from(decodedList);

      final mapedList =
          decodedList.map((e) => UserModel.fromJson((e))).toList();

      log('MapedList:$mapedList');

      try {
        final UserModel userFromShared = mapedList.firstWhere(
          (element) =>
              element.email == user.email && element.password == user.password,
        );

        log('UserFromShared: $userFromShared');

        state = LoginStateSucces(userFromShared);
        return state;
      } catch (e) {
        log(e.toString());
        state = LoginStateError('Credenciais inválidas');
        return state;
      }
    }
    state = LoginStateError('Credenciais inválidas');
    return state;
  }
}
