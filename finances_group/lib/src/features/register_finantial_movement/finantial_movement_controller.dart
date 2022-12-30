import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class FinantialMovementController {
  final IRepository<FinantialMovement> _repository;

  FinantialMovementController(this._repository);

  Future<bool> create(
      FinantialMovement finantialMovement, UserModel userModel) async {
    var result = await _repository.create(finantialMovement, userModel);
    return result ? true : false;
  }

  Future<List<FinantialMovement>> findAll(UserModel userModel) async {
    var result = await _repository.findAll(userModel);
    return result;
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
