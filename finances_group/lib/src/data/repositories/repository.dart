abstract class IRepository<T> {
  Future<bool> create(T value);
  Future<T> findOne(int id);
  Future<List<T>> findAll();
  Future<bool> delete(int id);
}
