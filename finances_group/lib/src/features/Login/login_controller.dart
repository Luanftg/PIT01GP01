import 'package:finances_group/src/data/repositories/auth_repository.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/features/login/login_state.dart';
import 'package:flutter/material.dart';

class LoginController extends ValueNotifier<LoginState> {
  // late LoginState value;

  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(LoginStateInit());

  Future<void> login(String email, String password) async {
    value = LoginStateLoading();
    final userLogin = LoginModel(email: email, password: password);
    try {
      var userLoged = await _authRepository.login(userLogin);
      if (userLoged == null) {
        value = LoginStateError('Credenciais inválidas');
      }
      value = LoginStateSucces(userLoged!);
    } catch (e) {
      value = LoginStateError('Erro ao realizar o login. Tente novamente!');
    }
  }

  void logout() {
    _authRepository.logout();
  }
}
