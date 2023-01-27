import 'package:finances_group/src/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> login(LoginModel loginModel);
  Future<void> register(RegisterModel registerModel);
  bool isUserLogged();
  Future<void> logout();
  UserModel? isAuthenticated();
}
