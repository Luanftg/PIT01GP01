//import 'package:finances_group/src/design/theme/custom_theme_data.dart';
import 'package:finances_group/src/view/pages/home_page.dart';
import 'package:flutter/material.dart';

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinanceApp',
      home: HomePage(),
      //theme:  lightTheme,
    );
  }
}
