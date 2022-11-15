import 'package:finances_group/src/models/finantial_movement.dart';

class User {
  final String? displayName;
  final String? email;
  final bool emailVerified;
  final String? phoneNumber;
  String? photoURL;
  final String uid;
  final double balance;
  List<FinantialMovement> finantialMovementList = [];
  User(
    this.emailVerified, {
    this.displayName,
    this.email,
    this.phoneNumber,
    this.photoURL,
    required this.uid,
    this.balance = 0.0,
  });
}
