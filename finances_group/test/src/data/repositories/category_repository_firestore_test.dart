// ignore_for_file: unused_import

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:finances_group/src/data/repositories/category_repository_firestore.dart';
import 'package:finances_group/src/models/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';

final categoryA = Category(label: 'Casa');
final categoryB = Category(label: 'Transporte');
final categoryC = Category(label: 'Energia');

void main() {
  late FakeFirebaseFirestore db;
  late CategoryRepositoryFirestore categoryRepositoryFirestore;

  setUp(() {
    db = FakeFirebaseFirestore();
    categoryRepositoryFirestore = CategoryRepositoryFirestore(db: db);
  });

  group('[Method]:  Future<List<String>> fetchCategories()', () {
    test(
        'should return a list of [String] from List of Category saved in Firebase',
        () async {
      await categoryRepositoryFirestore.db
          .collection('categories')
          .add(categoryA.toMap());
      await categoryRepositoryFirestore.db
          .collection('categories')
          .add(categoryB.toMap());
      final result = await categoryRepositoryFirestore.fetchCategories();

      expect(result, isA<List<String>>());
      expect(result.length, 2);
    });

    test('should return an empty list from Firebase', () async {
      final result = await categoryRepositoryFirestore.fetchCategories();
      expect(result, isA<List<String>>());
      expect(result, isEmpty);
    });
  });
  group('[Method]:  Future<void> create({required Category value})', () {
    test('should create a Category on Firebase', () async {
      await categoryRepositoryFirestore.create(value: categoryA);

      final result =
          await categoryRepositoryFirestore.db.collection('categories').get();
      expect(result.docs.length, 1);
    });
  });

  group('[Method]:  Future<List<Category>> findAll(String userID)', () {
    test('should return a list of [Category] from Firebase', () async {
      await categoryRepositoryFirestore.create(value: categoryA);
      await categoryRepositoryFirestore.create(value: categoryB);
      await categoryRepositoryFirestore.create(value: categoryC);
      var result = await categoryRepositoryFirestore.findAll('');

      expect(result, isA<List<Category>>());
      expect(result.length, 3);
    });

    test('should return an empty list from Firebase', () async {
      var result = await categoryRepositoryFirestore.findAll('');

      expect(result, isA<List<Category>>());
      expect(result, isEmpty);
    });

    // test('should return an Exception from Firebase', () async {
    //   whenCalling(Invocation.method(#collection, null)).on(db).thenThrow(
    //       Exception('[Erro ao obter todas as categorias do Firebase]'));
    //   await categoryRepositoryFirestore.findAll('');

    //   expect(() => categoryRepositoryFirestore.findAll(''), isA<Exception>());
    // });
  });
}
