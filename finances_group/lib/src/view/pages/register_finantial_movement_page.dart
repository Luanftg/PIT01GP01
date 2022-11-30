import 'package:finances_group/src/controller/home_controller.dart';

import 'package:finances_group/src/data/repositories/finantial_movement_repository_prefs_imp.dart';
import 'package:finances_group/src/models/category.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/view/widgets/register_finaltial_movement/custom_switch.dart';

import 'package:flutter/material.dart';
import '../../models/user_model.dart';

List<String> list = ['Vermelho', 'Azul', 'Amarelo', 'Verde'];

class RegisterFinantialMovementPage extends StatefulWidget {
  final UserModel? userLogged;
  const RegisterFinantialMovementPage({super.key, required this.userLogged});
  static bool valueSwitch = true;

  @override
  State<RegisterFinantialMovementPage> createState() =>
      _RegisterFinantialMovementPageState();
}

class _RegisterFinantialMovementPageState
    extends State<RegisterFinantialMovementPage> {
  String dropDownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        HomeController(FinantialMovementRepositoryPrefsImp());

    final registerContextNavigator = Navigator.of(context);
    var titleController = TextEditingController();
    var valueController = TextEditingController();
    var categoryController = TextEditingController();

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
                decoration: InputDecoration(
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
              DropdownButton(
                  value: dropDownValue,
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      dropDownValue = value!;
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Despesa'),
                  CustomSwitch(
                      valueSwitch: RegisterFinantialMovementPage.valueSwitch),
                  const Text('Receita'),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var finantialMovement = FinantialMovement(
                    description: titleController.text,
                    value: double.parse(valueController.text),
                    userID: 1,
                    isIncome: RegisterFinantialMovementPage.valueSwitch,
                    paymentDate: DateTime.now(),
                    category: Category(
                      label: categoryController.text,
                      color: homeController.categoryColor(dropDownValue),
                      image: RegisterFinantialMovementPage.valueSwitch
                          ? 'assets/income.png'
                          : 'assets/expense.png',
                    ),
                  );

                  await homeController.create(
                      finantialMovement, widget.userLogged!);
                  registerContextNavigator.pushNamed('/home',
                      arguments: widget.userLogged);
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
