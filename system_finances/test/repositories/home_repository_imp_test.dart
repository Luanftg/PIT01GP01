import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:system_finances/repositories/home_repository.dart';
import 'package:system_finances/repositories/home_repository_imp.dart';

void main() {
  final HomeRepository repository = HomeRepositoryImp();

  test('Espero que a entidade não seja nula', () async {
    final response = await repository.getList();
    log(response.toString());
    expect(response, isNotNull);
  });
}
