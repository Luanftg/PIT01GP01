import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/finantial_movement.dart';

class FinantialMovementRepositoryFirestore
    implements IRepository<FinantialMovement> {
  static const String finantialMovement = "finantialMovement";
  static const String users = 'users';

  final FirebaseFirestore db;

  String userId = '';

  FinantialMovementRepositoryFirestore(this.db);

  @override
  Future<void> create({required FinantialMovement value}) async {
    try {
      await db.collection(finantialMovement).doc(value.id).set(value.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      var docRef = db.collection(finantialMovement).doc(id);
      var doc = await docRef.get();

      var result = doc.exists;
      if (result) {
        await docRef.delete();
      }
    } catch (e) {
      throw Exception("[ERRO no DELETE do FireBase] -> ${e.toString()}");
    }
  }

  @override
  Future<List<FinantialMovement>> findAll(String userId) async {
    try {
      var mapedList = await db
          .collection(finantialMovement)
          .where("userID", isEqualTo: userId)
          .get();

      if (mapedList.docs.isEmpty) {
        return [];
      }
      var fmList = mapedList.docs
          .map((e) => FinantialMovement.fromMap(e.data()))
          .toList();
      return fmList;
    } catch (e) {
      throw Exception(
          "[ERRO ao tentar obter todas as Movimentações Financeiras do FireBase] -> ${e.toString()}");
    }
  }

  @override
  Future<FinantialMovement?> findOne(String id) async {
    try {
      var docSnap = await db.collection(finantialMovement).doc(id).get();
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
  Future<void> update(FinantialMovement value) async {
    try {
      await db.collection(finantialMovement).doc(value.id).set(value.toMap());
    } catch (e) {
      throw Exception('[Erro no UPDATE do Firebase] -> ${e.toString()}');
    }
  }
}
