import 'dart:async';

import 'package:finances_group/src/data/repositories/repository.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/features/home/home_state.dart';
import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<HomeState> {
  final IRepository<FinantialMovement> _finantialMovementRepositoryLocalImp;

  HomeController(this._finantialMovementRepositoryLocalImp)
      : super(HomeStateInitial());

  ValueNotifier<HomeState> userLogged = ValueNotifier(HomeStateInitial());

  double maxValue = 0;
  Future<bool> create(
      FinantialMovement finantialMovement, UserModel userModel) async {
    var result = await _finantialMovementRepositoryLocalImp.create(
        finantialMovement, userModel);
    return result ? true : false;
  }

  Future<List<FinantialMovement>> findAll(UserModel userModel) async {
    var result = await _finantialMovementRepositoryLocalImp.findAll(userModel);
    return result;
  }

  List<FinantialMovement>? getList(UserModel args) {
    return args.finantialMovementList;
  }

  Color categoryColor(String name) {
    final Color color;

    switch (name) {
      case 'Vermelho':
        color = Colors.red;
        break;
      case 'Amarelo':
        color = Colors.amber;
        break;
      case 'Verde':
        color = Colors.green;
        break;
      case 'Azul':
        color = Colors.blue;
        break;
      default:
        color = Colors.white;
    }
    return color;
  }
}
