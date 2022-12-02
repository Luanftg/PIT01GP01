import 'package:finances_group/src/features/Splash/splash_state.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = SplashController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      controller.isAuthenticated().then((value) {
        if (value is UserLogedSplashState) {
          Navigator.of(context)
              .pushReplacementNamed('/home', arguments: value.userLogged);
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      });
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
