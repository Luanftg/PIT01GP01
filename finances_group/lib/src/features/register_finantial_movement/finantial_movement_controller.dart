import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/finantial_movement.dart';

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
}
