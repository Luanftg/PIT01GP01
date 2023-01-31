import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/shared/design/theme/text_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  final UserModel userModel;
  const OnBoardingPage({super.key, required this.userModel});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text.rich(
                TextSpan(
                  text: 'Bem vindo ao Aplicativo de ',
                  style: CustomAppTextTheme.largeCaption,
                  children: <InlineSpan>[
                    TextSpan(
                        text: '\nFinanças Pessoais',
                        style: CustomAppTextTheme.headline1
                            .copyWith(color: AppCustomColors.primary)),
                  ],
                ),
              ),
              Stepper(
                  elevation: 48,
                  currentStep: currentStep,
                  onStepCancel: () {
                    if (currentStep > 0) {
                      setState(() {
                        currentStep--;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (currentStep < 3) {
                      currentStep += 1;
                      if (currentStep > 3) {
                        Navigator.of(context)
                            .pushNamed('/home', arguments: widget.userModel);
                      }
                      setState(() {});
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      currentStep = index;
                    });
                  },
                  steps: <Step>[
                    Step(
                      state: StepState.editing,
                      title: Text.rich(
                        TextSpan(
                          text: '1° passo:  ',
                          style: CustomAppTextTheme.body,
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Adicione uma foto de perfil',
                              style: CustomAppTextTheme.headlineStep,
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        'Utilize a sua galeria ou a camêra!',
                        style: CustomAppTextTheme.label,
                      ),
                      content: TextButton(
                          child: Text(
                            'Navegue para Configurações',
                            style: CustomAppTextTheme.headlineStep
                                .copyWith(color: AppCustomColors.primary),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/user-profile',
                              arguments: widget.userModel,
                            );
                          }),
                    ),
                    Step(
                      state: StepState.editing,
                      title: Text.rich(
                        TextSpan(
                          text: '2° passo:  ',
                          style: CustomAppTextTheme.body,
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Simule um valor futuro',
                              style: CustomAppTextTheme.headlineStep,
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        'Utilize a calculadora de valor futuro para simular um investimento',
                        style: CustomAppTextTheme.label,
                      ),
                      content: TextButton(
                          child: Text(
                            'Simular Valor futuro',
                            style: CustomAppTextTheme.headlineStep
                                .copyWith(color: AppCustomColors.primary),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/simulator',
                            );
                          }),
                    ),
                    Step(
                      state: StepState.editing,
                      title: Text.rich(
                        TextSpan(
                          text: '3° passo:  ',
                          style: CustomAppTextTheme.body,
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Adicione uma Movimentação Financeira',
                              style: CustomAppTextTheme.headlineStep,
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        'Cadastre uma Despesa ou Receita',
                        style: CustomAppTextTheme.label,
                      ),
                      content: TextButton(
                          child: Text(
                            'Adicionar Movimentação Financeira',
                            style: CustomAppTextTheme.headlineStep
                                .copyWith(color: AppCustomColors.primary),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                '/add-finantial-movement',
                                arguments: {
                                  'title': 'Adicionar',
                                  'userLoged': widget.userModel,
                                });
                          }),
                    ),
                    Step(
                      state: StepState.complete,
                      title: Text('Após as 3 etapas anteriores...',
                          style: CustomAppTextTheme.headlineStep),
                      content: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/home',
                              arguments: widget.userModel,
                            );
                          },
                          child: Text(
                            'Ir para Tela Principal',
                            style: CustomAppTextTheme.headlineStep
                                .copyWith(color: AppCustomColors.primary),
                          )),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
