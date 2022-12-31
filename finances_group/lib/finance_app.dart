import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/shared/design/theme/custom_theme_data.dart';
import 'package:finances_group/src/features/home/home_page.dart';
import 'package:finances_group/src/features/login/login_page.dart';
import 'package:finances_group/src/features/register/register_page.dart';
import 'package:finances_group/src/features/splash/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: AppCustomColors.mainBackgroug,
          systemNavigationBarDividerColor: AppCustomColors.mainBackgroug),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinanceApp',
      initialRoute: '/splash',
      routes: {
        '/home': (context) => HomePage(
            userLogged:
                (ModalRoute.of(context)!.settings.arguments) as UserModel),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/splash': (context) => const SplashPage(),
      },
      theme: draculaTheme,
    );
  }
}
