abstract class IRepository<T> {
  Future<bool> create(T value);
  Future<T?> findOne(String id);
  Future<List<T>> findAll();
  Future<bool> delete(String id);
  Future<bool> update(T value);
}
