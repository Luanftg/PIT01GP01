import 'package:flutter/material.dart';
import 'package:system_finances/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginControler;
  const CustomLoginButtonComponent({super.key, required this.loginControler});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginControler.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? const CircularProgressIndicator()
          : ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                loginControler.auth().then(
                  (result) {
                    if (result) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Falha ao realizar o login'),
                          duration: Duration(seconds: 5),
                        ),
                      );
                    }
                  },
                );
              },
              child: const Text('Login'),
            ),
    );
  }
}
