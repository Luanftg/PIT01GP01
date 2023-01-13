import 'package:finances_group/src/data/services/auth.service.dart';
import 'package:finances_group/src/models/user_model.dart';

class SplashController {
  AuthService authService = AuthService();
  Future<UserModel?> isAuthenticated() async {
    Future.delayed(const Duration(seconds: 2));
    final UserModel? userLogged = await authService.isUserLoged();
    return userLogged;
  }
}
