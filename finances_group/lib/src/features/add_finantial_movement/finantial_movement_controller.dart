import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/data/services/firestore_service.dart';

import 'package:finances_group/src/models/finantial_movement.dart';

import '../../models/category.dart';

class FinantialMovementController {
  final IRepository<FinantialMovement> _repository;

  FinantialMovementController(this._repository);

  Future<void> saveCategory(Category category) async {
    await FireStoreService.saveCategory(category);
  }

  Future<List<String>> fetchCategories() async {
    return await FireStoreService.fetchCategories();
  }

  Future<void> create(FinantialMovement finantialMovement) async {
    await _repository.create(value: finantialMovement);
  }

  Future<List<FinantialMovement>> findAll(String userId) async {
    var result = await _repository.findAll(userId);
    return result;
  }

  Future<void> delete(String id) async {
    await _repository.delete(id);
  }
}
