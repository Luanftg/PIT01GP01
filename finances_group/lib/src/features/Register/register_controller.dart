import 'package:finances_group/src/data/repositories/firebase_auth_repository.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterController {
  final authService = FirebaseAuthRepository(FirebaseAuth.instance);

  Future<void> register(String name, String email, String phoneNumber,
      String cpf, String password) async {
    RegisterModel registerModel = RegisterModel(
      email: email,
      name: name,
      password: password,
    );

    authService.register(registerModel);
  }
}
