import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/models/category.dart';

class CategoryRepositoryFirestore implements IRepository<Category> {
  @override
  Future<void> create({required Category value}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> findAll(String userID) {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<Category?> findOne(String id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<void> update(Category value) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
