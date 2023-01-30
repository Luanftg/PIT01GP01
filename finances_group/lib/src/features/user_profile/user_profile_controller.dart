import 'package:finances_group/src/data/repositories/firebase_auth_repository.dart';

class UserProfileController {
  final FirebaseAuthRepository firebaseAuthRepository;

  UserProfileController(this.firebaseAuthRepository);

  Future<void> updateUserPhotoUrl(String photoUrl) async {
    await firebaseAuthRepository.updateUserPhotoUrl(photoUrl);
  }

  Future<void> updateUserName(String userName) async {
    await firebaseAuthRepository.updateUserName(userName);
  }

  Future<void> updateUserEmail(String userEmail) async {
    await firebaseAuthRepository.updateUserEmail(userEmail);
  }

  Future<void> updateUserPassword(String userPassword) async {
    await firebaseAuthRepository.updatePassword(userPassword);
  }
}
