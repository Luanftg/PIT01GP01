import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/category.dart';
import 'package:finances_group/src/models/finantial_movement.dart';

import '../../models/user_model.dart';

class FinantialMovementController {
  final IRepository<FinantialMovement> _repository;

  FinantialMovementController(this._repository);

  final db = FirebaseFirestore.instance;
  static const String categorias = 'categories';

  Future<void> saveCategory(Category category) async {
    await db.collection(categorias).add(category.toMap());
  }

  Future<List<String>> fetchCategories() async {
    var listaDeMapDeCategoria = await db.collection(categorias).get();
    if (listaDeMapDeCategoria.docs.isEmpty) {
      return [];
    }
    List<String> listaDeCategoria = [];

    for (var element in listaDeMapDeCategoria.docs) {
      listaDeCategoria.add(element["label"]);
    }
    return listaDeCategoria;
  }

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
