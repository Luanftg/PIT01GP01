import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/features/add_finantial_movement/widgets/custom_switch.dart';

import 'package:finances_group/src/features/home/home_state.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController(this._repository) : super(HomeStateInitial());

  final IRepository<FinantialMovement> _repository;
  List<FinantialMovement> cachedList = [];

  Future<void> cacheFinantialMoventList(String id) async {
    value = HomeStateLoading();
    try {
      cachedList = await _repository.findAll(id);
      fetchFinantialMovement();
    } catch (e) {
      value = HomeStateError(e.toString());
    }
  }

  void fetchFinantialMovement() {
    value = HomeStateLoading();
    List<FinantialMovement> returnList = [];

    if (CustomSwitch.valueSwitch.value) {
      returnList =
          cachedList.where((element) => element.isIncome == true).toList();
      value = HomeStateSucess(returnList);
    } else {
      returnList =
          cachedList.where((element) => element.isIncome == false).toList();
      value = HomeStateSucess(returnList);
    }
    if (returnList.isEmpty) {
      value = HomeStateWelcome();
    }
  }

  Future<void> delete(String id) async {
    await _repository.delete(id);
  }
}
