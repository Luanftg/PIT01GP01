import '../../models/user_model.dart';

abstract class IRepository<T> {
  Future<bool> create(T value, UserModel userModel);
  Future<T> findOne(int id);
  Future<List<T>> findAll(UserModel userModel);
  Future<bool> delete(int id);
}
