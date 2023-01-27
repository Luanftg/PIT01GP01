import 'package:finances_group/src/data/repositories/auth_repository.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository(this._firebaseAuth);

  @override
  bool isUserLogged() {
    return _firebaseAuth.currentUser != null ? true : false;
  }

  @override
  Future<UserModel?> login(LoginModel loginModel) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: loginModel.email, password: loginModel.password!);
      final user = userCredential.user;
      if (user != null) {
        var userModel = UserModel(
            id: user.uid,
            email: loginModel.email,
            isLogged: true,
            name: user.displayName ?? '');
        return userModel;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> register(RegisterModel registerModel) async {
    await Future.delayed(const Duration(seconds: 1));

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password!,
      );
      await _firebaseAuth.currentUser?.updateDisplayName(registerModel.name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este e-mail já está cadastrado!');
      }
    }
  }

  @override
  UserModel? isAuthenticated() {
    var userLogged = _firebaseAuth.currentUser;
    if (userLogged == null) {
      return null;
    }
    var loginModel = UserModel(id: userLogged.uid, email: userLogged.email!);
    return loginModel;
  }
}

class AuthException implements Exception {
  String message;

  AuthException(this.message);
}
