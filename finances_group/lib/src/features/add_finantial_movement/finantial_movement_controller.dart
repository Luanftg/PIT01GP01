import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/finantial_movement.dart';

import '../../models/category.dart';

class FinantialMovementController {
  final IRepository<FinantialMovement> _finantialMovementRepository;
  final IRepository<Category> _categoryRepository;
  List<Category> cachedCategoryList = [];

  FinantialMovementController(
    this._finantialMovementRepository,
    this._categoryRepository,
  );

  Future<void> saveCategory(Category category) async {
    await _categoryRepository.create(value: category);
  }

  Future<void> cacheCategory() async {
    try {
      cachedCategoryList = await _categoryRepository.findAll('');
      // fetchCategories();
    } catch (e) {
      throw Exception("[Erro na busca por categorias]");
    }
  }

  List<String> fetchCategories(bool isIncome) {
    // try {
    //   final listaDeCategoria = await _categoryRepository.findAll('');
    //   if (listaDeCategoria.isEmpty) {
    //     return [];
    //   }
    //   List<String> listaDeString = [];

    //   for (var categoria in listaDeCategoria) {
    //     listaDeString.add(categoria.label);
    //   }
    //   return listaDeString;
    // } catch (e) {
    //   throw Exception("[Erro na busca por categorias]");
    // }

    // List<Category> listaDeReceita = [];
    // List<Category> listaDeDespesa = [];
    List<Category> listaDeCategoria = [];
    List<String> listaDeString = [];

    // listaDeDespesa = cachedCategoryList
    //     .where((element) => element.isIncome == false)
    //     .toList();
    // listaDeReceita = cachedCategoryList
    //     .where((element) => element.isIncome == true)
    //     .toList();
    listaDeCategoria = cachedCategoryList
        .where((element) => element.isIncome == isIncome)
        .toList();

    listaDeString = List.generate(
        listaDeCategoria.length, (index) => listaDeCategoria[index].label);

    return listaDeString;
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
