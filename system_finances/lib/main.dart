import 'package:flutter/material.dart';
import 'package:system_finances/view/pages/home_page_v2.dart';
import 'package:system_finances/view/pages/login_page.dart';
import 'package:system_finances/view/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => const HomePageV2(),
      },
      theme: ThemeData(primaryColor: Colors.green),
    );
  }
}
