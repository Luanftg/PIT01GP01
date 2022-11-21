List<User> users = [
  User(
    true,
    uid: '1',
    displayName: 'Nícolas Kormann',
    email: 'kormann.nicolas@gmail.com',
    phoneNumber: '(47) 9999-0000',
    balance: 10000,
    // photoURL:
    //     'https://media-exp1.licdn.com/dms/image/C4D03AQEoqxz5Ur8xIw/profile-displayphoto-shrink_200_200/0/1661958896044?e=1671667200&v=beta&t=s1ikt5EvvbLEXcHOjrah9mVcUDrlahFACjBjH3C5TS8'
  ),
];

class User {
  final String? displayName;
  final String? email;
  final bool emailVerified;
  final String? phoneNumber;
  String? photoURL;
  final String uid;
  final double balance;

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
