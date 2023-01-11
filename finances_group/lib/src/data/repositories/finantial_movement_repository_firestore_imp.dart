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
        await db
            .collection(users)
            .doc(userModel.id!)
            .collection(finantialMovement)
            .add(value.toMap());
        return true;
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return false;
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
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
    return fmList;
  }

  @override
  Future<FinantialMovement> findOne(int id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }
}
