//import 'package:finances_group/src/design/theme/custom_theme_data.dart';
import 'package:finances_group/src/view/design/theme/custom_theme_data.dart';
import 'package:finances_group/src/view/pages/home_page.dart';
import 'package:finances_group/src/view/pages/login_page.dart';
import 'package:finances_group/src/view/pages/register_finantial_movement_page.dart';
import 'package:finances_group/src/view/pages/register_page.dart';
import 'package:finances_group/src/view/pages/teste.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: const Color.fromARGB(255, 50, 53, 66),
          systemNavigationBarDividerColor:
              const Color.fromARGB(255, 50, 53, 66)),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinanceApp',
      initialRoute: '/login',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/teste': (context) => const Teste(),
        '/registerFM': (context) => const RegisterFinantialMovementPage(),
      },
      theme: draculaTheme,
    );
  }
}
