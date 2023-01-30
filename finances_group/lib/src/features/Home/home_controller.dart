import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/features/add_finantial_movement/widgets/custom_switch.dart';

import 'package:finances_group/src/features/home/home_state.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/shared/utils/month.dart';
import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController(this._repository) : super(HomeStateInitial());

  final IRepository<FinantialMovement> _repository;
  List<FinantialMovement> cachedList = [];
  int currentMonth = DateTime.now().month;
  String get labelMonth => Month.returnLabel(currentMonth);

  void incrementMonth() {
    if (currentMonth == 12) {
      currentMonth = 0;
    }
    currentMonth++;
    fetchFinantialMovement(month: currentMonth);
  }

  void decrementMonth() {
    if (currentMonth == 1) {
      currentMonth = 13;
    }
    currentMonth--;
    fetchFinantialMovement(month: currentMonth);
  }

  Future<void> cacheFinantialMoventList(String id) async {
    value = HomeStateLoading();
    try {
      cachedList = await _repository.findAll(id);
      fetchFinantialMovement();
    } catch (e) {
      value = HomeStateError(e.toString());
    }
  }

  void fetchFinantialMovement({int? month}) {
    month ??= currentMonth;
    value = HomeStateLoading();
    List<FinantialMovement> returnList = [];

    if (CustomSwitch.valueSwitch.value) {
      returnList = cachedList
          .where((element) => element.isIncome == true)
          .where(
            (element) =>
                element.paymentDate!.substring(4, 5) == month.toString(),
          )
          .toList();
      value = HomeStateSucess(returnList);
    } else {
      returnList = cachedList
          .where((element) => element.isIncome == false)
          .where(
            (element) =>
                element.paymentDate!.substring(4, 5) == month.toString(),
          )
          .toList();
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
