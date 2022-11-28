import 'dart:convert';

import 'finantial_movement.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? cpf;
  final String? password;
  final String? photoURL;
  late List<FinantialMovement>? finantialMovementList;

  UserModel({
    this.name,
    required this.email,
    this.phone,
    this.cpf,
    required this.password,
    this.photoURL,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? cpf,
    String? password,
    String? photoURL,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      password: password ?? this.password,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'photoURL': photoURL,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      cpf: map['cpf'] as String,
      photoURL: map['photoURL'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, cpf: $cpf, photoURL: $photoURL ,password: $password)';
  }

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
