import 'package:finances_group/src/data/services/auth.service.dart';
import 'package:finances_group/src/models/user_model.dart';

import 'splash_state.dart';

class SplashController {
  SplashController();

  Future<SplashState> isAuthenticated() async {
    AuthService authService = AuthService();

    final UserModel? userLogged = await authService.isUserLoged();

    if (userLogged != null) {
      return UserLogedSplashState(userLogged);
    }
    return UserUnLogedSplashState();
  }
}
