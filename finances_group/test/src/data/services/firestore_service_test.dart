import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    // final db = FirebaseFirestore.instance;
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // const String categorias = 'categories';
    // const String users = 'users';
  });
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
