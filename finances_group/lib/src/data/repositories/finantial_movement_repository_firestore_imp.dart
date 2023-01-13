import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/data/repositories/repository.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FinantialMovementRepositoryFirestoreImp
    implements IRepository<FinantialMovement> {
  static const String finantialMovement = "finantialMovement";
  static const String users = 'users';

  static final db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String userId = '';

  String get _getUserId {
    userId = firebaseAuth.currentUser?.uid ?? '';
    return userId;
  }

  @override
  Future<bool> create(FinantialMovement value) async {
    if (_getUserId.isNotEmpty) {
      try {
        var colectionReference =
            db.collection(users).doc(_getUserId).collection(finantialMovement);

        bool fmExist;
        var docRef = await colectionReference.get();
        if (docRef.docs.isEmpty) {
          fmExist = false;
        } else {
          fmExist =
              docRef.docs.every((element) => element.data()["id"] == value.id);
        }

        if (fmExist) {
          //EDITA
          var result = await update(value);
          return result ? true : false;
        }

        //Salva
        var newDocRef = await colectionReference.add(value.toMap());
        var fmWithId = await newDocRef.get();
        value.id = fmWithId.id;
        var result = await update(value);
        return result ? true : false;
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return false;
  }

  @override
  Future<bool> delete(String id) async {
    try {
      var docRef = db
          .collection(users)
          .doc(_getUserId)
          .collection(finantialMovement)
          .doc(id);
      var doc = await docRef.get();

      var result = doc.exists;
      if (result) {
        await docRef.delete();
      }

      return result;
    } catch (e) {
      throw Exception("[ERRO no DELETE do FireBase] -> ${e.toString()}");
    }
  }

  @override
  Future<List<FinantialMovement>> findAll() async {
    var mapedList = await db
        .collection(users)
        .doc(_getUserId)
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
  Future<FinantialMovement?> findOne(String id) async {
    try {
      var docSnap = await db
          .collection(users)
          .doc(_getUserId)
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
  }

  @override
  Future<bool> update(FinantialMovement value) async {
    if (value.id == null) {
      return false;
    }
    try {
      await db
          .collection(users)
          .doc(_getUserId)
          .collection(finantialMovement)
          .doc(value.id)
          .set(value.toMap());
      return true;
    } catch (e) {
      throw Exception('[Erro no UPDATE do Firebase] -> ${e.toString()}');
    }
  }
}
