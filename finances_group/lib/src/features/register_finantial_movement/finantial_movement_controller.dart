import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/data/services/firestore_service.dart';

import 'package:finances_group/src/models/finantial_movement.dart';

import '../../models/category.dart';
import '../../models/user_model.dart';

class FinantialMovementController {
  final IRepository<FinantialMovement> _repository;

  FinantialMovementController(this._repository);

  Future<void> saveCategory(Category category) async {
    await FireStoreService.saveCategory(category);
  }

  Future<List<String>> fetchCategories() async {
    return await FireStoreService.fetchCategories();
  }

  Future<bool> create(
      FinantialMovement finantialMovement, UserModel userModel) async {
    var result = await _repository.create(finantialMovement, userModel);
    if (userModel.finantialMovementList == null) {
      List<FinantialMovement> list = [];
      list.add(finantialMovement);
      userModel.finantialMovementList = list;
    } else {
      userModel.finantialMovementList!.add(finantialMovement);
    }

    return result ? true : false;
  }

  Future<List<FinantialMovement>> findAll(UserModel userModel) async {
    var result = await _repository.findAll(userModel);
    return result;
  }
}
