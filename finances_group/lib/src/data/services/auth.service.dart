import 'package:finances_group/src/data/services/firestore_service.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;

  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authcheck();
  }

  _authcheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  void register(String email, String password, String name, String phone,
      String cpf) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      usuario?.updateDisplayName(name);

      _getUser();

      FireStoreService.registerUser(UserModel(usuario?.uid,
          email: usuario?.email, name: name, phone: phone, cpf: cpf));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este e-mail já está cadastrado!');
      }
    }
  }

  void login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() {
    _auth.signOut();
    _getUser();
  }
}
