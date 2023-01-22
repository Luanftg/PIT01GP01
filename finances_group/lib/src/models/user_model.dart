import 'package:uuid/uuid.dart';

const uuid = Uuid();

class UserModel {
  String id;
  String name;
  final String email;
  final String? password;
  String? photoURL;
  bool isLogged;

  UserModel({
    this.id = '',
    this.name = '',
    required this.email,
    this.password,
    this.photoURL,
    this.isLogged = false,
  }) {
    if (id.isEmpty) {
      id = uuid.v1();
    }
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'password': password});
    if (photoURL != null) {
      result.addAll({'photoURL': photoURL});
    }
    result.addAll({'isLogged': isLogged});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      photoURL: map['photoURL'],
      isLogged: map['isLogged'] ?? false,
    );
  }
}

class LoginModel extends UserModel {
  LoginModel({
    required super.email,
    required super.password,
  }) : super();
}

class RegisterModel extends UserModel {
  RegisterModel({
    required super.name,
    required super.email,
    required super.password,
  }) : super();
}
