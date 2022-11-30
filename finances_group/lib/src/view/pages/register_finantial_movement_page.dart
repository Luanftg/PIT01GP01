import 'package:finances_group/src/controller/home_controller.dart';

import 'package:finances_group/src/data/repositories/finantial_movement_repository_prefs_imp.dart';
import 'package:finances_group/src/models/category.dart';

import 'package:finances_group/src/models/finantial_movement.dart';

import 'package:flutter/material.dart';
import '../../models/user_model.dart';

List<String> list = ['Vermelho', 'Azul', 'Amarelo', 'Verde'];

class RegisterFinantialMovementPage extends StatefulWidget {
  final UserModel userLogged;
  const RegisterFinantialMovementPage({super.key, required this.userLogged});

  @override
  State<RegisterFinantialMovementPage> createState() =>
      _RegisterFinantialMovementPageState();
}

class _RegisterFinantialMovementPageState
    extends State<RegisterFinantialMovementPage> {
  bool valueSwitch = true;
  String dropDownValue = list.first;

  @override
  Widget build(BuildContext context) {
    //final UserModel userModel =
    //ModalRoute.of(context)!.settings.arguments as UserModel;

    final HomeController homeController =
        HomeController(FinantialMovementRepositoryPrefsImp());

    // final userLogged = ModalRoute.of(context)!.settings.arguments as UserModel;

    final registerContextNavigator = Navigator.of(context);
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
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
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8),
                  label: const Text('Título:'),
                ),
                controller: titleController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8),
                  label: const Text('Valor:'),
                ),
                controller: valueController,
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8),
                  label: const Text('Categoria:'),
                ),
                controller: categoryController,
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
                  Switch(
                      activeColor: Colors.blue,
                      inactiveTrackColor: Colors.red,
                      value: valueSwitch,
                      onChanged: (value) {
                        valueSwitch = value;
                        setState(() {});
                      }),
                  const Text('Receita'),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  var finantialMovement = FinantialMovement(
                    description: descriptionController.text,
                    value: double.parse(valueController.text),
                    userID: 1,
                    isIncome: true,
                    category: Category(
                        label: categoryController.text, color: Colors.blue),
                  );

                  await homeController.create(
                      finantialMovement, widget.userLogged);
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
