// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:system_finances/repositories/home_repository.dart';

import 'package:system_finances/state/user_state.dart';

class UserStore extends ValueNotifier<UserState> {
  final HomeRepository repository;
  UserStore(this.repository) : super(InitialUserState());

  Future fetchUsers() async {
    value = LoadindUserState();
    try {
      final users = await repository.getList();
      value = SucessUserState(users);
    } catch (e) {
      value = ErrorUserState(e.toString());
    }
  }
}
