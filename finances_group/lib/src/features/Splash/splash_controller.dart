import 'package:finances_group/src/data/repositories/firebase_auth_repository.dart';

import 'package:finances_group/src/models/user_model.dart';

class SplashController {
  FirebaseAuthRepository authRepository;
  SplashController({
    required this.authRepository,
  });

  Future<UserModel?> isAuthenticated() async {
    Future.delayed(const Duration(seconds: 2));
    return authRepository.isAuthenticated();
  }
}
