import 'package:finances_group/src/controller/register_controller.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/widgets/login-register/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // FALTA IMPLEMENTAR CONTROLLERS
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

  final cpfFormater = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  final phoneFormater = MaskTextInputFormatter(
    mask: '(##)# ####-####',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
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
                    CustomTextFormField(
                      controller: phoneController,
                      icon: Icons.phone,
                      label: 'Celular',
                      inputFormatters: [phoneFormater],
                      typeKeyboard: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: cpfController,
                      icon: Icons.numbers_outlined,
                      label: 'CPF',
                      inputFormatters: [cpfFormater],
                      typeKeyboard: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      icon: Icons.key_outlined,
                      label: 'Senha',
                      isSecret: true,
                      typeKeyboard: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        registerController
                            .register(
                              RegisterModel(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                cpf: cpfController.text,
                                password: passwordController.text,
                              ),
                            )
                            .then((value) =>
                                Navigator.of(context).pushNamed('/login'));
                      },
                      child: const Text(
                        'Cadastrar',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
