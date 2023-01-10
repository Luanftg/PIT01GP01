import 'dart:convert';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class PrefsService {
  static const String _userAuthenticated = 'user1';

  static Future<SharedPreferences> getInstance() async {
    return SharedPreferences.getInstance();
  }

  static Future<bool> save(
      FinantialMovement finantialMovement, UserModel userModel) async {
    var prefs = await getInstance();
    var register = prefs.getStringList(_userAuthenticated);
    bool result = false;

    if (register != null) {
      final decodedList = register.map((e) => jsonDecode(e)).toList();
      final mapedList =
          decodedList.map((e) => UserModel.fromJson((e))).toList();
      final int indexUser = mapedList.indexOf(userModel);
      List<FinantialMovement>? fmList = userModel.finantialMovementList;

      if (fmList != null && fmList.isNotEmpty) {
        userModel.finantialMovementList!.add(finantialMovement);

        mapedList[indexUser] = userModel;

        final userListToSave = mapedList.map((e) => jsonEncode(e)).toList();

        result = await prefs.setStringList(_userAuthenticated, userListToSave);
        return result;
      } else {
        var registerList = <String>[];
        userModel.finantialMovementList = [];
        userModel.finantialMovementList!.add(finantialMovement);

        mapedList[indexUser] = userModel;

        registerList = mapedList.map((e) => jsonEncode(e)).toList();

        result = await prefs.setStringList(_userAuthenticated, registerList);
        return result;
      }
    }
    return false;
  }

  static Future<String> readFile() async {
    var prefs = await getInstance();

    var jsonResult = prefs.getStringList(_userAuthenticated);

    if (jsonResult != null) {
      var jsonString = jsonEncode(jsonResult);
      return jsonString;
    }
    return '';
  }

  Future<void> register(RegisterModel user) async {
    late List<UserModel> userList;
    final prefs = await SharedPreferences.getInstance();

    var result = prefs.getStringList('user1');

    if (result != null) {
      final decodedList = result.map((e) => jsonDecode(e));

      final mapedList =
          decodedList.map((e) => UserModel.fromJson((e))).toList();

      mapedList.add(user);

      final userListToSave = mapedList.map((e) => jsonEncode(e)).toList();
      await prefs.setStringList('user1', userListToSave);
    } else {
      userList = [];
      userList.add(user);
      final userListToSave = userList.map((e) => jsonEncode(e)).toList();

      await prefs.setStringList('user1', userListToSave);
    }
  }

  Future<void> logar(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? users = prefs.getStringList('user1');

    if (users != null) {
      final decodedList = users.map((e) => jsonDecode(e)).toList();

      final mapedList =
          decodedList.map((e) => UserModel.fromJson((e))).toList();
      final UserModel userFromShared = mapedList.firstWhere(
        (element) =>
            element.email == user.email && element.password == user.password,
      );
      userFromShared.isLogged = true;

      final userListToSave = mapedList.map((e) => jsonEncode(e)).toList();
      await prefs.setStringList('user1', userListToSave);
    }

    void logout(UserModel userModel) async {
      final prefs = await SharedPreferences.getInstance();

      final List<String>? users = prefs.getStringList('user1');
      final decodedList = users!.map((e) => jsonDecode(e)).toList();
      final mapedList =
          decodedList.map((e) => UserModel.fromJson((e))).toList();
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

  Future<bool> isAuthenticated() async {
    final pref = await SharedPreferences.getInstance();
    final listFromShared = pref.getStringList('user1');
    if (listFromShared != null) {
      final decodedList = listFromShared.map((e) => jsonDecode(e)).toList();
      final mapedList = decodedList.map((e) => UserModel.fromJson(e)).toList();
      final bool haveUserLogged =
          mapedList.any((element) => element.isLogged == true);

      if (haveUserLogged) {
        final UserModel userLogged =
            mapedList.firstWhere((element) => element.isLogged == true);

        if (userLogged.isLogged != null) {
          return userLogged.isLogged!;
        }

        return false;
      }
    }
    return false;
  }
}
