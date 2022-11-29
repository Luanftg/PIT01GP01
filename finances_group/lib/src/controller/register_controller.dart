import 'dart:convert';
import 'dart:developer';

import 'package:finances_group/src/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController {
  late List<UserModel> userList;

  Future<void> register(RegisterModel user) async {
    final prefs = await SharedPreferences.getInstance();

    var result = prefs.getStringList('user1');

    log(result.toString());

    if (result != null) {
      final decodedList = result.map((e) => jsonDecode(e));

      final mapedList =
          decodedList.map((e) => UserModel.fromJson((e))).toList();

      mapedList.add(user);

      log(mapedList.toString());

      final userListToSave = mapedList.map((e) => jsonEncode(e)).toList();
      await prefs.setStringList('user1', userListToSave);
    } else {
      userList = [];
      userList.add(user);
      final userListToSave = userList.map((e) => jsonEncode(e)).toList();

      log(userListToSave.toString());

      await prefs.setStringList('user1', userListToSave);
    }
  }
}
