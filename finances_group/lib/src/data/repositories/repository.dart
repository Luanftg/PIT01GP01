abstract class IRepository<T> {
  Future<void> create({required T value});
  Future<T?> findOne(String id);
  Future<List<T>> findAll();
  Future<void> delete(String id);
  Future<void> update(T value);
}
