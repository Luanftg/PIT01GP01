import 'package:finances_group/src/data/services/auth_service.dart';
import 'package:finances_group/src/features/splash/splash_controller.dart';

import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller =
      SplashController(authService: AuthService());
  @override
  void initState() {
    super.initState();

    controller.isAuthenticated().then((value) {
      value != null
          ? Navigator.of(context)
              .pushReplacementNamed('/home', arguments: value)
          : Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppCustomColors.dark,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
