import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:finances_group/src/data/repositories/finantial_movement_repository_firestore_imp.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

//class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

void main() {
  late FakeFirebaseFirestore db;
  late FirebaseAuthMock firebaseAuth;
  late FinantialMovementRepositoryFirestoreImp fMRepositoryFirestoreImp;

  final fm = {
    "description": 'Energia',
    "value": 200,
    "id": 'Id',
    "userID": 'userID',
    "isIncome": false,
    "paymentDate": '${DateTime.now()}',
    "category": {
      "label": 'Casa',
      "image": 'urlConta',
      "color": 'materialColor'
    },
  };
  final finantialMovement = FinantialMovement.fromMap(fm);

  setUp(() {
    db = FakeFirebaseFirestore();
    firebaseAuth = FirebaseAuthMock();
    fMRepositoryFirestoreImp =
        FinantialMovementRepositoryFirestoreImp(db, firebaseAuth);
  });
  group('[Method]: Future<void> create(FinantialMovement value)', () {
    test(
        'should return a list of [FinantialMovement] with 1 item saved on firebase',
        () async {
      await fMRepositoryFirestoreImp.create(value: finantialMovement);

      var snapshot = await fMRepositoryFirestoreImp.db
          // .collection('users')
          // .doc(finantialMovement.userID)
          .collection('finantialMovement')
          .get();
      var result = snapshot.size;

      expect(result, 1);
    });
  });
  // test('should return [Exception] if there was a error on firebase', () async {
  //   when(
  //     () => fMRepositoryFirestoreImp.create(value: any(named: 'value')),
  //   ).thenThrow(Exception());

  //   await fMRepositoryFirestoreImp.create(value: finantialMovement);

  //   expect(
  //       () => fMRepositoryFirestoreImp.create(
  //             value: finantialMovement,
  //           ),
  //       throwsException);
  // });

  group('[Method]: Future<void> delete(String id)', () {
    test(
        'should return an empty list if all [FinantialMovement] was deleted from firebase',
        () async {
      await fMRepositoryFirestoreImp.create(value: finantialMovement);
      await fMRepositoryFirestoreImp.delete(finantialMovement.id);
      var fmList = await fMRepositoryFirestoreImp.findAll();
      expect(fmList, isEmpty);
    });
    // test('should return [Exception] if there was a error on firebase', () {});
  });

  group('[Method]: Future<List<FinantialMovement>> findAll()', () {
    test('should return [List<FinantialMovement>] if sucess.', () async {
      await fMRepositoryFirestoreImp.create(value: finantialMovement);
      var fmList = await fMRepositoryFirestoreImp.findAll();
      expect(fmList.length, 1);
    });
    test('first time user logged = should return an empty List', () async {
      await fMRepositoryFirestoreImp.db
          // .collection('users')
          // .doc(finantialMovement.userID)
          .collection('finantialMovement')
          .doc(finantialMovement.id)
          .delete();
      var fmList = await fMRepositoryFirestoreImp.findAll();
      expect(fmList, isEmpty);
    });

    // test('should return [Exception] if there was a error on firebase', () {});
  });

  group('[Method]: Future<FinantialMovement?> findOne(String id)', () {
    test(
        'should return [FinantialMovement] if there was one already saved on firebase.',
        () async {
      await fMRepositoryFirestoreImp.create(value: finantialMovement);
      var result = await fMRepositoryFirestoreImp.findOne(finantialMovement.id);
      expect(result!.id, finantialMovement.id);
    });
    test('should return [null] if dont.', () async {
      await fMRepositoryFirestoreImp.delete(finantialMovement.id);
      var result = await fMRepositoryFirestoreImp.findOne('Id');
      expect(result, isNull);
    });
    // test('should return [Exception] if there was a error on firebase', () {});
  });

  // group('[Method]: Future<bool> update(FinantialMovement value)', () {
  //   test(
  //       'should return "true" if a [FinantialMovement] was updated from firebase',
  //       () {});
  //   test('should return "false" if a [FinantialMovement.id] is null', () {});
  //   test('should return [Exception] if there was a error on firebase', () {});
  // });
//}
}
