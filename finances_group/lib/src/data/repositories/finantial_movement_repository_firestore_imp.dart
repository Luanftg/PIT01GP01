import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/data/repositories/repository.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/models/user_model.dart';

class FinantialMovementRepositoryFirestoreImp
    implements IRepository<FinantialMovement> {
  static const String finantialMovement = "finantialMovement";
  static const String users = 'users';

  static final db = FirebaseFirestore.instance;

  @override
  Future<bool> create(FinantialMovement value, UserModel userModel) async {
    if (userModel.id != null) {
      try {
        var docRef = await db
            .collection(users)
            .doc(userModel.id!)
            .collection(finantialMovement)
            .add(value.toMap());
        var fmWithId = await docRef.get();
        value.id = fmWithId.id;
        await db
            .collection(users)
            .doc(userModel.id)
            .collection(finantialMovement)
            .doc(fmWithId.id)
            .set(value.toMap());
        return true;
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return false;
  }

  @override
  Future<bool> delete(String id, UserModel userModel) async {
    try {
      var docRef = db
          .collection(users)
          .doc(userModel.id)
          .collection(finantialMovement)
          .doc(id);
      var doc = await docRef.get();
      log('-------------$doc-------');
      if (doc.exists) await docRef.delete();

      return true;
    } catch (e) {
      throw Exception("[ERRO no DELETE do FireBase] -> ${e.toString()}");
    }
  }

  @override
  Future<List<FinantialMovement>> findAll(UserModel userModel) async {
    var mapedList = await db
        .collection(users)
        .doc(userModel.id)
        .collection(finantialMovement)
        .get();
    if (mapedList.docs.isEmpty) {
      return [];
    }
    var fmList =
        mapedList.docs.map((e) => FinantialMovement.fromMap(e.data())).toList();
    log('************************FINDALL*******************');
    return fmList;
  }

  @override
  Future<FinantialMovement?> findOne(String id, UserModel userModel) async {
    if (userModel.finantialMovementList != null &&
        userModel.finantialMovementList!.isNotEmpty) {
      try {
        var docSnap = await db
            .collection(users)
            .doc(userModel.id)
            .collection(finantialMovement)
            .doc(id)
            .get();
        if (docSnap.exists) {
          var fmMap = docSnap.data();
          var fm = FinantialMovement.fromMap(fmMap!);
          return fm;
        }
        return null;
      } catch (e) {
        throw Exception('[Erro no findONE do FireBase] -> ${e.toString()}');
      }
    } else {
      return null;
    }
  }

  @override
  Future<bool> update(FinantialMovement value, UserModel userModel) async {
    if (value.id == null) {
      return false;
    }
    try {
      await db
          .collection(users)
          .doc(userModel.id)
          .collection(finantialMovement)
          .doc(userModel.id)
          .set(value.toMap());
      return true;
    } catch (e) {
      throw Exception('[Erro no UPDATE do Firebase] -> ${e.toString()}');
    }
  }
}
