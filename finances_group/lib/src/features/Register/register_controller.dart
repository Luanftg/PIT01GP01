import 'package:finances_group/src/data/services/auth_service.dart';
import 'package:finances_group/src/models/user_model.dart';

class RegisterController {
  final authService = AuthService();

  Future<void> register(String name, String email, String phoneNumber,
      String cpf, String password) async {
    UserModel userModel = UserModel(null,
        email: email,
        cpf: cpf,
        name: name,
        password: password,
        phone: phoneNumber);

    authService.register(userModel);
  }
}
