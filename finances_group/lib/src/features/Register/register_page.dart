import 'package:finances_group/src/features/register/register_controller.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../../shared/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerController = RegisterController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();

  final loginKey = GlobalKey();

  @override
  void initState() {
    _setStatusbarColor();
    super.initState();
  }

  _setStatusbarColor() {
    FlutterStatusbarcolor.setStatusBarColor(AppCustomColors.dark);
  }

  // final cpfFormater = MaskTextInputFormatter(
  //   mask: '###.###.###-##',
  //   filter: {
  //     '#': RegExp(r'[0-9]'),
  //   },
  // );

  // final phoneFormater = MaskTextInputFormatter(
  //   mask: '(##)# ####-####',
  //   filter: {
  //     '#': RegExp(r'[0-9]'),
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: loginKey,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: nameController,
                      icon: Icons.person_outline,
                      label: 'Nome',
                      typeKeyboard: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      icon: Icons.mail_outline,
                      label: 'E-mail',
                      typeKeyboard: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    // CustomTextFormField(
                    //   controller: phoneController,
                    //   icon: Icons.phone,
                    //   label: 'Celular',
                    //   inputFormatters: [phoneFormater],
                    //   typeKeyboard: TextInputType.number,
                    //   textInputAction: TextInputAction.next,
                    // ),
                    // CustomTextFormField(
                    //   controller: cpfController,
                    //   icon: Icons.numbers_outlined,
                    //   label: 'CPF',
                    //   inputFormatters: [cpfFormater],
                    //   typeKeyboard: TextInputType.number,
                    //   textInputAction: TextInputAction.next,
                    // ),
                    CustomTextFormField(
                      controller: passwordController,
                      icon: Icons.key_outlined,
                      label: 'Senha',
                      isSecret: true,
                      typeKeyboard: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await registerController.register(
                          nameController.text,
                          emailController.text,
                          phoneController.text,
                          cpfController.text,
                          passwordController.text,
                        );
                        navigator.pushNamed('/login');
                      },
                      child: const Text(
                        'Cadastrar',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
