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
    try {
      usermodel.id = _auth.currentUser?.uid ?? '';
      await db.collection(users).doc(usermodel.id).set(usermodel.toMap());
    } catch (e) {
      throw Exception("[Erro ao salvar um usuario no Firebase]");
    }
  }

  static Future<UserModel?> getUserById(String? id) async {
    try {
      var documentSnapshot = await db.collection(users).doc(id).get();
      if (documentSnapshot.exists) {
        var usermodel = UserModel.fromMap(documentSnapshot.data()!);
        return usermodel;
      }
      return null;
    } catch (e) {
      throw Exception("[Erro ao obter um usuario no Firebase]");
    }
  }

  static Future<void> saveCategory(Category category) async {
    try {
      await db.collection(categorias).add(category.toMap());
    } catch (e) {
      throw Exception("[Erro ao salvar uma categoira no Firebase]");
    }
  }

  static Future<List<String>> fetchCategories() async {
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
}
