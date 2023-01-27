import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/category.dart';

class CategoryRepositoryFirestore implements IRepository<Category> {
  late FirebaseFirestore db;
  final String categorias = 'categories';

  CategoryRepositoryFirestore({
    required this.db,
  });

  Future<List<String>> fetchCategories() async {
    try {
      var listaDeMapDeCategoria = await db.collection(categorias).get();
      if (listaDeMapDeCategoria.docs.isEmpty) {
        return [];
      }
      List<String> listaDeCategoria = [];

      for (var element in listaDeMapDeCategoria.docs) {
        listaDeCategoria.add(element["label"]);
      }
      return listaDeCategoria;
    } catch (e) {
      throw Exception("[Erro na busca por categorias]");
    }
  }

  @override
  Future<void> create({required Category value}) async {
    try {
      await db.collection(categorias).add(value.toMap());
    } catch (e) {
      throw Exception("[Erro ao salvar uma categoira no Firebase]");
    }
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> findAll(String userID) async {
    try {
      var listaDeMapDeCategoria = await db.collection(categorias).get();
      var listaDeCategorias = listaDeMapDeCategoria.docs
          .map((e) => Category.fromMap(e.data()))
          .toList();
      return listaDeCategorias;
    } catch (e) {
      throw Exception('[Erro ao obter todas as categorias do Firebase]');
    }
  }

  @override
  Future<Category?> findOne(String id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<void> update(Category value) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
