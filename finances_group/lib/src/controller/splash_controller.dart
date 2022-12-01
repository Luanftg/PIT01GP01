import 'dart:convert';

import 'package:finances_group/src/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../states/splash_state.dart';

class SplashController {
  SplashController();

  Future<SplashState> isAuthenticated() async {
    final pref = await SharedPreferences.getInstance();
    final listFromShared = pref.getStringList('user1');
    if (listFromShared != null) {
      final decodedList = listFromShared!.map((e) => jsonDecode(e)).toList();
      final mapedList = decodedList.map((e) => UserModel.fromJson(e)).toList();
      final bool haveUserLogged =
          mapedList.any((element) => element.isLogged == true);

      if (haveUserLogged) {
        final UserModel userLogged =
            mapedList.firstWhere((element) => element.isLogged == true);
        return (userLogged.isLogged == true)
            ? UserLogedSplashState(userLogged)
            : UserUnLogedSplashState();
      } else {
        return UserUnLogedSplashState();
      }
    } else {
      return UserUnLogedSplashState();
    }
  }
}
