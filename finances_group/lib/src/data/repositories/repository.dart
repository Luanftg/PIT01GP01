import '../../models/user_model.dart';

abstract class IRepository<T> {
  Future<bool> create(T value, UserModel userModel);
  Future<T?> findOne(String id, UserModel userModel);
  Future<List<T>> findAll(UserModel userModel);
  Future<bool> delete(String id, UserModel userModel);
  Future<bool> update(T value, UserModel userModel);
}
