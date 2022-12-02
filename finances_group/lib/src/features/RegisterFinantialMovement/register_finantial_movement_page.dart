import 'package:finances_group/src/features/home/home_controller.dart';

import 'package:finances_group/src/data/repositories/finantial_movement_repository_prefs_imp.dart';
import 'package:finances_group/src/features/RegisterFinantialMovement/widgets/customDropdownButton/customDropDownButton.dart';
import 'package:finances_group/src/models/category.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/features/RegisterFinantialMovement/widgets/register_finaltial_movement/custom_switch.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/user_model.dart';

class RegisterFinantialMovementPage extends StatefulWidget {
  final UserModel? userLogged;
  const RegisterFinantialMovementPage({super.key, required this.userLogged});
  static bool valueSwitch = true;
  static String colorString = '';

  @override
  State<RegisterFinantialMovementPage> createState() =>
      _RegisterFinantialMovementPageState();
}

class _RegisterFinantialMovementPageState
    extends State<RegisterFinantialMovementPage> {
  final HomeController homeController =
      HomeController(FinantialMovementRepositoryPrefsImp());

  var titleController = TextEditingController();
  var valueController = TextEditingController();
  var categoryController = TextEditingController();

  final CustomDropDownButton customDropDownButton = const CustomDropDownButton(
    list: ['Vermelho', 'Azul', 'Amarelo', 'Verde'],
  );

  @override
  Widget build(BuildContext context) {
    final registerContextNavigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar movimentação')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8),
                  label: const Text('Título:'),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: valueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //prefixText: 'R\$',
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8),
                  label: const Text('Valor:'),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8),
                  label: const Text('Categoria:'),
                ),
              ),
              const SizedBox(height: 30),
              customDropDownButton,
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Despesa'),
                  CustomSwitch(),
                  Text('Receita'),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final DateFormat formater = DateFormat('yyyy-MM-dd');
                  var finantialMovement = FinantialMovement(
                    description: titleController.text,
                    value: double.parse(valueController.text),
                    userID: 1,
                    isIncome: RegisterFinantialMovementPage.valueSwitch,
                    paymentDate: formater.format(DateTime.now()).toString(),
                    category: Category(
                      label: categoryController.text,
                      color: homeController.categoryColor(
                        RegisterFinantialMovementPage.colorString,
                      ),
                      image: RegisterFinantialMovementPage.valueSwitch
                          ? 'assets/income.png'
                          : 'assets/expense.png',
                    ),
                  );

                  await homeController.create(
                    finantialMovement,
                    widget.userLogged!,
                  );
                  registerContextNavigator.pushNamed(
                    '/home',
                    arguments: widget.userLogged,
                  );
                },
                child: const Text('Adicionar'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
