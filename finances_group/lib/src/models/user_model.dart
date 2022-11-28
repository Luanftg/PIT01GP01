import 'dart:convert';

import 'finantial_movement.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? cpf;
  final String? password;
  final String? photoURL;
  List<FinantialMovement>? finantialMovementList;

  UserModel(
      {this.name,
      required this.email,
      this.phone,
      this.cpf,
      required this.password,
      this.photoURL,
      this.finantialMovementList});

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.cpf == cpf &&
        other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        cpf.hashCode ^
        password.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (cpf != null) {
      result.addAll({'cpf': cpf});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (photoURL != null) {
      result.addAll({'photoURL': photoURL});
    }
    if (finantialMovementList != null) {
      result.addAll({
        'finantialMovementList':
            finantialMovementList!.map((x) => x.toMap()).toList()
      });
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      cpf: map['cpf'],
      password: map['password'],
      photoURL: map['photoURL'],
      finantialMovementList: map['finantialMovementList'] != null
          ? List<FinantialMovement>.from(map['finantialMovementList']
              ?.map((x) => FinantialMovement.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, cpf: $cpf, password: $password, photoURL: $photoURL, finantialMovementList: $finantialMovementList)';
  }
}

class LoginModel extends UserModel {
  LoginModel({
    required super.email,
    required super.password,
  });
}

class RegisterModel extends UserModel {
  RegisterModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.cpf,
    required super.password,
    required super.photoURL,
  });
}
