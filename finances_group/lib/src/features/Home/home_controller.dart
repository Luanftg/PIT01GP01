import 'package:finances_group/src/features/home/home_state.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController() : super(HomeStateInitial());

  void fetchUserLogged(UserModel userModel) {
    try {
      value = HomeStateLoading();
      if (userModel.finantialMovementList != null &&
          userModel.finantialMovementList!.isNotEmpty) {
        value = HomeStateSucess(userModel);
      } else {
        value = HomeStateWelcome(userModel);
      }
    } catch (e) {
      value = HomeStateError(e.toString());
    }
  }
}
