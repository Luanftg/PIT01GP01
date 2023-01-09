import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/category.dart';

class FireStoreService {
  static final db = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String categorias = 'categories';
  static const String users = 'users';

  static Future<void> saveCategory(Category category) async {
    await db.collection(categorias).add(category.toMap());
  }

  static Future<void> registerUser(UserModel usermodel) async {
    await db
        .collection(users)
        .doc(_auth.currentUser?.uid)
        .set(usermodel.toMap());
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
