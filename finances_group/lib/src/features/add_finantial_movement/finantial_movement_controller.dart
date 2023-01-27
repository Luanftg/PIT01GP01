import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/finantial_movement.dart';

import '../../models/category.dart';

class FinantialMovementController {
  final IRepository<FinantialMovement> _finantialMovementRepository;
  final IRepository<Category> _categoryRepository;

  FinantialMovementController(
    this._finantialMovementRepository,
    this._categoryRepository,
  );

  Future<void> saveCategory(Category category) async {
    await _categoryRepository.create(value: category);
  }

  Future<List<String>> fetchCategories() async {
    try {
      final listaDeCategoria = await _categoryRepository.findAll('');
      if (listaDeCategoria.isEmpty) {
        return [];
      }
      List<String> listaDeString = [];

      for (var categoria in listaDeCategoria) {
        listaDeString.add(categoria.label);
      }
      return listaDeString;
    } catch (e) {
      throw Exception("[Erro na busca por categorias]");
    }
  }

  Future<void> create(FinantialMovement finantialMovement) async {
    await _finantialMovementRepository.create(value: finantialMovement);
  }

  Future<List<FinantialMovement>> findAll(String userId) async {
    var result = await _finantialMovementRepository.findAll(userId);
    return result;
  }

  Future<void> delete(String id) async {
    await _finantialMovementRepository.delete(id);
  }
}
