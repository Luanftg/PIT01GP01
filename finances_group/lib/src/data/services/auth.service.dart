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

  Future<UserModel?> isUserLoged() async {
    var userFromFireBaseAuth = _auth.currentUser;
    if (userFromFireBaseAuth != null) {
      var userModel =
          await FireStoreService.getUserById(userFromFireBaseAuth.uid);
      if (userModel != null) {
        userModel.isLogged = true;
        return userModel;
      }
      return null;
    }
    return null;
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  void register(UserModel userModel) async {
    await Future.delayed(const Duration(seconds: 1));

    if (userModel.email != null || userModel.password != null) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: userModel.email!,
          password: userModel.password!,
        );
        usuario?.updateDisplayName(userModel.name);

        _getUser();
        userModel.id = usuario?.uid;
        //userModel.isLogged = true;
        FireStoreService.registerUser(userModel);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          throw AuthException('A senha é muito fraca');
        } else if (e.code == 'email-already-in-use') {
          throw AuthException('Este e-mail já está cadastrado!');
        }
      }
    } else {
      throw Exception("Informar email e senha");
    }
  }

  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
      var userLoged = await FireStoreService.getUserById(usuario?.uid);
      if (userLoged != null) {
        userLoged.isLogged = true;
        //
        return userLoged;
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

  logout() {
    _auth.signOut();
    _getUser();
  }
}
