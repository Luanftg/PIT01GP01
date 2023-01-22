import 'package:finances_group/src/data/repositories/firebase_auth_repository.dart';
import 'package:finances_group/src/features/login/login_controller.dart';
import 'package:finances_group/src/features/login/login_state.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../../shared/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final controller =
      LoginController(FirebaseAuthRepository(FirebaseAuth.instance));

  final loginKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _setStatusbarColor();
  }

  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppCustomColors.dark);
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    const Text('Entrar', style: TextStyle(fontSize: 32)),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: emailController,
                      icon: Icons.mail_outline,
                      label: 'E-mail',
                      typeKeyboard: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      icon: Icons.key_outlined,
                      label: 'Senha',
                      isSecret: true,
                      typeKeyboard: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    ElevatedButton(
                      onPressed: <Object>() async {
                        await controller.login(
                          emailController.text,
                          passwordController.text,
                        );

                        if (controller.value is LoginStateLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (controller.value is LoginStateSucces) {
                          return navigator.pushNamed('/home',
                              arguments: (controller.value as LoginStateSucces)
                                  .userModel);
                        }
                        if (controller.value is LoginStateError) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Ops, algo deu errado'),
                                  icon: const Icon(Icons.error),
                                  backgroundColor: AppCustomColors.danger,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  content: SizedBox(
                                    height: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text('Credenciais Inválidas!'),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                      child: const Text('Entrar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: const Text(
                        'Não tem login? Cadastre-se',
                        style: TextStyle(
                          color: AppCustomColors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
