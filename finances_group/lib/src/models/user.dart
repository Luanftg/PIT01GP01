import 'dart:convert';

import 'package:finances_group/src/models/finantial_movement.dart';

class User {
  final String? displayName;
  final String? email;
  final bool emailVerified;
  final String? phoneNumber;
  String? photoURL;
  final String uid;
  final double balance;
  List<FinantialMovement>? finantialMovementList = [];
  User(
    this.emailVerified, {
    this.displayName,
    this.email,
    this.phoneNumber,
    this.photoURL,
    required this.uid,
    this.balance = 0.0,
  });

  @override
  String toString() {
    return 'User(displayName: $displayName, email: $email, emailVerified: $emailVerified, phoneNumber: $phoneNumber, photoURL: $photoURL, uid: $uid, balance: $balance, finantialMovementList: $finantialMovementList)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (displayName != null) {
      result.addAll({'displayName': displayName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    result.addAll({'emailVerified': emailVerified});
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (photoURL != null) {
      result.addAll({'photoURL': photoURL});
    }
    result.addAll({'uid': uid});
    result.addAll({'balance': balance});
    result.addAll({
      'finantialMovementList':
          finantialMovementList!.map((x) => x.toMap()).toList()
    });

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['emailVerified'] ?? false,
      displayName: map['displayName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      photoURL: map['photoURL'],
      uid: map['uid'] ?? '',
      balance: map['balance']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
