import 'package:finances_group/src/view/widgets/homepage/action_app_bar.dart';
import 'package:finances_group/src/view/widgets/homepage/title_app_bar.dart';
import 'package:flutter/material.dart';

final appBar = AppBar(
  elevation: 0.0,
  centerTitle: false,
  //backgroundColor: FinanceColors.primary,
  toolbarHeight: 80,
  title: const TitleAppBar(),
  actions: const [ActionAppBar()],
);
