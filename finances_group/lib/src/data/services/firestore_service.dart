import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/category.dart';

class FireStoreService {
  static final db = FirebaseFirestore.instance;
  static const String categorias = 'categories';

  static Future<void> saveCategory(Category category) async {
    await db.collection(categorias).add(category.toMap());
  }

  static Future<List<String>> fetchCategories() async {
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
}
