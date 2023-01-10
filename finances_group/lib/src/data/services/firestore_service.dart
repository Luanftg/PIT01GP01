import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/category.dart';

class FireStoreService {
  static final db = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String categorias = 'categories';
  static const String users = 'users';

  static Future<void> registerUser(UserModel usermodel) async {
    usermodel.id = _auth.currentUser?.uid;
    await db.collection(users).doc(usermodel.id).set(usermodel.toMap());
  }

  static Future<UserModel?> getUserById(String? id) async {
    var documentSnapshot = await db.collection(users).doc(id).get();
    if (documentSnapshot.exists) {
      var usermodel = UserModel.fromMap(documentSnapshot.data()!);
      return usermodel;
    }
    return null;
  }

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
