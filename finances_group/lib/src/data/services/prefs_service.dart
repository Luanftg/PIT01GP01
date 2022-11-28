import 'dart:convert';
import 'dart:developer';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class PrefsService {
  //static const String _userAuthenticated = 'userAuthenticated0';
  static const String _userAuthenticated = 'user1';

  static Future<bool> save(
      FinantialMovement finantialMovement, UserModel userModel) async {
    var prefs = await SharedPreferences.getInstance();
    var register = prefs.getStringList(_userAuthenticated);
    log('register: $register');
    bool result = false;

    if (register != null) {
      final decodedList = register.map((e) => jsonDecode(e)).toList();
      final mapedList =
          decodedList.map((e) => UserModel.fromJson((e))).toList();

      log('MapedList: $mapedList');
      final int indexUser = mapedList.indexOf(userModel);
      List<FinantialMovement>? fmList = userModel.finantialMovementList;

      if (fmList != null && fmList.isNotEmpty) {
        userModel.finantialMovementList!.add(finantialMovement);
        // log('UserModel: ${userModel.toString()}');
        mapedList[indexUser] = userModel;
        // log('mapedList: ${mapedList.toString()}');
        final userListToSave = mapedList.map((e) => jsonEncode(e)).toList();
        //log('UserListToSave: ${userModel.toString()}');
        result = await prefs.setStringList(_userAuthenticated, userListToSave);
        return result;
      } else {
        var registerList = <String>[];
        // userModel.finantialMovementList = [];
        userModel.finantialMovementList!.add(finantialMovement);
        //log('UserModel: $userModel');
        mapedList[indexUser] = userModel;
        //log('mapedList: $mapedList');
        registerList = mapedList.map((e) => jsonEncode(e)).toList();
        //log('registerList: $registerList');
        result = await prefs.setStringList(_userAuthenticated, registerList);
        return result;
      }
    }
    return false;
  }

  static Future<String> readFile() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getStringList(_userAuthenticated);

    if (jsonResult != null) {
      var jsonString = jsonEncode(jsonResult);
      return jsonString;
    }
    return '';
  }
}
