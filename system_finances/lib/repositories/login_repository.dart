import 'package:system_finances/models/user_model.dart';

abstract class LoginRepository {
  Future<List<UserModel>> getUser();
}
