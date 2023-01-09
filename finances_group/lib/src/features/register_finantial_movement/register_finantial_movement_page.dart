import 'package:finances_group/src/data/repositories/finantial_movement_repository_prefs_imp.dart';
import 'package:finances_group/src/features/register_finantial_movement/finantial_movement_controller.dart';
import 'package:finances_group/src/features/register_finantial_movement/widgets/custom_dropdown_button.dart';
import 'package:finances_group/src/features/register_finantial_movement/widgets/custom_switch.dart';
import 'package:finances_group/src/models/category.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../../models/user_model.dart';

class RegisterFinantialMovementPage extends StatefulWidget {
  final UserModel? userLogged;
  const RegisterFinantialMovementPage({super.key, this.userLogged});

  @override
  State<RegisterFinantialMovementPage> createState() =>
      _RegisterFinantialMovementPageState();
}

class _RegisterFinantialMovementPageState
    extends State<RegisterFinantialMovementPage> {
  final FinantialMovementController controller =
      FinantialMovementController(FinantialMovementRepositoryPrefsImp());

  var titleController = TextEditingController();
  var valueController = TextEditingController();
  var categoryController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  static bool isNewCategory = false;
  List<String> listaDeCategoria = [];

  @override
  void initState() {
    _fetchCategories();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    valueController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void _fetchCategories() async {
    listaDeCategoria = await controller.fetchCategories();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final registerContextNavigator = Navigator.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar movimentação')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Despesa'),
                    CustomSwitch(),
                    Text('Receita'),
                  ],
                ),
                TextFormField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'O campo Título não pode ser vazio';
                    }
                    return null;
                  },
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
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'O campo Valor não pode ser vazio';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8),
                    label: const Text('Valor:'),
                  ),
                ),
                const SizedBox(height: 30),
                Visibility(
                  visible: isNewCategory,
                  child: TextFormField(
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return 'O campo Categoria não pode ser vazio';
                      }
                      return null;
                    },
                    controller: categoryController,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8),
                      label: const Text('Categoria:'),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isNewCategory,
                      child: CustomDropDownButton(list: listaDeCategoria),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isNewCategory = !isNewCategory;
                        });
                      },
                      child:
                          Icon(!isNewCategory ? Icons.add : Icons.arrow_back),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    bool? isFormValid = globalKey.currentState?.validate();
                    final DateFormat formater =
                        DateFormat('yyyy-MM-dd HH:MM:ss');
                    var finantialMovement = FinantialMovement(
                      description: titleController.text,
                      value: double.tryParse(valueController.text) ?? 0,
                      userID:
                          int.tryParse((widget.userLogged?.id).toString()) ?? 1,
                      isIncome: CustomSwitch.valueSwitch,
                      paymentDate: formater.format(DateTime.now()),
                      category: Category(
                        label: isNewCategory
                            ? categoryController.text
                            : CustomDropDownButton.dropDownValue ?? "",
                        image: CustomSwitch.valueSwitch
                            ? 'assets/income.png'
                            : 'assets/expense.png',
                      ),
                    );

                    if (isFormValid ?? false) {
                      await controller.create(
                          finantialMovement, widget.userLogged!);
                      if (!listaDeCategoria
                          .contains(finantialMovement.category.label)) {
                        await controller
                            .saveCategory(finantialMovement.category);
                      }
                      registerContextNavigator.pushNamed(
                        '/home',
                        arguments: widget.userLogged,
                      );
                    }
                  },
                  child: const Text('Adicionar'),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
