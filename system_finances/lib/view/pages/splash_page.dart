import 'package:flutter/material.dart';
import 'package:system_finances/services/prefs_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      PrefsService.isAuth(),
      Future.delayed(const Duration(seconds: 3)),
    ]).then(
      (value) => value[0]
          ? Navigator.of(context).pushReplacementNamed('/home')
          : Navigator.of(context).pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white54,
        ),
      ),
    );
  }
}
