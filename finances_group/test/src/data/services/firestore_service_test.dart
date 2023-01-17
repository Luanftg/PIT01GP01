import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FireBaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class FirestoreMock extends Mock implements FirebaseFirestore {}

class UserMock extends Mock implements User {}

void main() {
  // late final FireStoreService fireStoreService;
  // late final FirestoreMock db;
  // late final FireBaseAuthMock _auth;

  // const String categorias = 'categories';
  // const String users = 'users';

  // setUp(() {
  //   db = FirestoreMock();
  //   _auth = FireBaseAuthMock();
  //   fireStoreService = FireStoreService();
  // });
  group('[Method]: static Future<void> registerUser(UserModel usermodel)', () {
    test('should save a [UserModel] on firebase', () {});
    test('should return a [Exception] when catch [FirebaseError]', () {});
  });

  group('[Method]: static Future<UserModel?> getUserById(String? id)', () {
    test('should get a single [UserModel] from firebase', () {});
    test('should return a [Exception] when catch [FirebasError]', () {});
  });

  group('[Method]: static Future<void> saveCategory(Category category)', () {
    test('should save a single [Category] from firebase', () {});
    test('should return a [Exception] when catch [FirebasError]', () {});
  });

  group('[Method]: static Future<List<String>> fetchCategories()', () {
    test('should get a [List<String>] from firebase', () {});
  });
}
