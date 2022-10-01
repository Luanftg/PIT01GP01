import 'package:flutter_test/flutter_test.dart';
import 'package:system_finances/repositories/home_repository.dart';
import 'package:system_finances/repositories/home_repository_imp.dart';

void main() {
  final HomeRepository repository = HomeRepositoryImp();

  test('deve retornar todos os produtos', () async {
    final response = await repository.getList();
    print(response);
  });
}
