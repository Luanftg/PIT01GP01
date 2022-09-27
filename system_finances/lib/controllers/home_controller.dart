import 'package:flutter/material.dart';
import 'package:system_finances/models/user_model.dart';
import 'package:system_finances/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<UserModel>> users = ValueNotifier<List<UserModel>>([]);

  fetch() async {
    users.value = await _homeRepository.getList();
  }
}
