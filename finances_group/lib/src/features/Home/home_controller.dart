import 'package:finances_group/src/data/repositories/repository.dart';

import 'package:finances_group/src/features/home/home_state.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController(this._repository) : super(HomeStateInitial());

  final IRepository<FinantialMovement> _repository;

  Future<void> fetchUserLogged(UserModel userModel) async {
    value = HomeStateLoading();
    try {
      var fmList = await _repository.findAll();
      userModel.finantialMovementList = fmList;
      if (userModel.finantialMovementList!.isNotEmpty) {
        value = HomeStateSucess(userModel);
      } else {
        value = HomeStateWelcome(userModel);
      }
    } catch (e) {
      value = HomeStateError(e.toString());
    }
  }

  Future<void> delete(String id) async {
    await _repository.delete(id);
  }
}
