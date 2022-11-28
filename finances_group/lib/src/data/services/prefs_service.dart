import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _userAuthenticated = 'userAuthenticated0';

  static Future<bool> save(String finantialMovement) async {
    var prefs = await SharedPreferences.getInstance();
    var register = prefs.getStringList(_userAuthenticated);
    log('register: $register');
    bool result = false;
    if (register != null) {
      register.add(finantialMovement);
      result = await prefs.setStringList(
        _userAuthenticated,
        register,
      );
      return result;
    } else {
      var registerList = <String>[];
      registerList.add(finantialMovement);
      result = await prefs.setStringList(_userAuthenticated, registerList);
      return result;
    }
  }

  static Future<String> readFile() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getStringList(_userAuthenticated);
    log('jsonResult = $jsonResult');

    if (jsonResult != null) {
      var jsonString = jsonEncode(jsonResult);
      log('jsonString = $jsonString');
      return jsonString;
    }
    return '';
  }
}
