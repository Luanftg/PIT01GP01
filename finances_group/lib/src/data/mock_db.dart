import 'dart:core';
import 'dart:math';

import '../models/data_item.dart';
import '../models/user.dart';
import '../view/design/colors/app_custom_colors.dart';

final List<DataItem> dataset = [
  DataItem(value: 0.3, label: 'Casa', color: AppCustomColors.cyan),
  DataItem(value: 0.2, label: 'Transporte', color: AppCustomColors.danger),
  DataItem(value: 0.4, label: 'Estudos', color: AppCustomColors.primary),
  DataItem(value: 0.1, label: 'Outros', color: AppCustomColors.secondary),
];

var random = Random();

var weekData = List<double>.generate(
  100,
  (index) => random.nextDouble() * 100.0,
);
List<User> users = [
  User(true,
      uid: '1',
      displayName: 'Nícolas Kormann',
      email: 'kormann.nicolas@gmail.com',
      phoneNumber: '(47) 9999-0000',
      balance: 10000,
      finantialMovementList: [],
      photoURL:
          'https://media-exp1.licdn.com/dms/image/C4D03AQEoqxz5Ur8xIw/profile-displayphoto-shrink_200_200/0/1661958896044?e=1671667200&v=beta&t=s1ikt5EvvbLEXcHOjrah9mVcUDrlahFACjBjH3C5TS8'),
];
