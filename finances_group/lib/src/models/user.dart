import 'package:finances_group/src/models/finantial_movement.dart';

class User {
  final String? displayName;
  final String? email;
  final bool emailVerified;
  final String? phoneNumber;
  String? photoURL;
  final String uid;
  final double balance;
  List<FinantialMovement> finantialMovementList;

  User(
    this.emailVerified, {
    required this.finantialMovementList,
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
}
