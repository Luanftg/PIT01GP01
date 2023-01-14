import 'package:finances_group/src/data/repositories/repository.dart';
import 'package:finances_group/src/data/services/auth.service.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/features/login/login_state.dart';

class LoginController {
  late LoginState state;
  final IRepository<FinantialMovement> repository;
  final authService = AuthService();

  LoginController({required this.repository});

  Future<void> logar(String email, String password) async {
    state = LoginStateLoading();
    try {
      var userLoged = await authService.login(email, password);
      if (userLoged == null) {
        state = LoginStateError('Credenciais inválidas');
      }
      var fmList = await repository.findAll();
      userLoged!.finantialMovementList = fmList;
      state = LoginStateSucces(userLoged);
    } catch (e) {
      state = LoginStateError('Credenciais inválidas');
    }
  }

  void logout(UserModel userModel) {
    authService.logout();
  }
}
