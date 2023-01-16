import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    // final db = FirebaseFirestore.instance;
    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // const String finantialMovements = 'finaltialMovements';
    // const String users = 'users';
  });
  group('[Method]: Future<bool> create(FinantialMovement value)', () {
    test('should return "true" if a [FinantialMovement] was saved on firebase',
        () {});
    test(
        'should return "false" if a [FinantialMovement] was NOT saved on firebase',
        () {});
    test('should return [Exception] if there was a error on firebase', () {});
  });

  group('[Method]: Future<bool> delete(String id)', () {
    test(
        'should return "true" if a [FinantialMovement] was delete from firebase',
        () {});
    test(
        'should return "false" if a [FinantialMovement] was NOT deleted on firebase',
        () {});
    test('should return [Exception] if there was a error on firebase', () {});
  });

  group('[Method]: Future<List<FinantialMovement>> findAll()', () {
    test('should return [List<FinantialMovement>] if sucess.', () {});
    test('should return an empty List', () {});
    test('should return [Exception] if there was a error on firebase', () {});
  });

  group('[Method]: Future<FinantialMovement?> findOne(String id)', () {
    test(
        'should return [FinantialMovement] if there was one already saved on firebase.',
        () {});
    test('should return [null] if dont.', () {});
    test('should return [Exception] if there was a error on firebase', () {});
  });

  group('[Method]: Future<bool> update(FinantialMovement value)', () {
    test(
        'should return "true" if a [FinantialMovement] was updated from firebase',
        () {});
    test('should return "false" if a [FinantialMovement.id] is null', () {});
    test('should return [Exception] if there was a error on firebase', () {});
  });
}
