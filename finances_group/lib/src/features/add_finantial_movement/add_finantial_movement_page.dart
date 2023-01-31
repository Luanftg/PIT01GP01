import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/data/repositories/category_repository_firestore.dart';
import 'package:finances_group/src/data/repositories/finantial_movement_repository_firestore.dart';

import 'package:finances_group/src/features/add_finantial_movement/finantial_movement_controller.dart';
import 'package:finances_group/src/features/add_finantial_movement/widgets/custom_dropdown_button.dart';
import 'package:finances_group/src/features/add_finantial_movement/widgets/custom_switch.dart';
import 'package:finances_group/src/models/category.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/shared/widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../../models/user_model.dart';

class AddFinantialMovementPage extends StatefulWidget {
  final UserModel? userLogged;
  final String title;
  final FinantialMovement? finantialMovement;
  const AddFinantialMovementPage(
      {super.key,
      this.userLogged,
      required this.title,
      this.finantialMovement});

  @override
  State<AddFinantialMovementPage> createState() =>
      _AddFinantialMovementPageState();
}

class _AddFinantialMovementPageState extends State<AddFinantialMovementPage> {
  final FinantialMovementController controller = FinantialMovementController(
    FinantialMovementRepositoryFirestore(FirebaseFirestore.instance),
    CategoryRepositoryFirestore(db: FirebaseFirestore.instance),
  );

  var titleController = TextEditingController();
  var valueController = TextEditingController();
  var categoryController = TextEditingController();
  var dateController = TextEditingController();
  DateTime? dateTime;
  final globalKey = GlobalKey<FormState>();
  static bool isNewCategory = false;
  List<String> listaDeReceita = [];
  List<String> listaDeDEspesa = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
    CustomSwitch.valueSwitch.addListener(() {
      listaDeReceita = controller.fetchCategories(true);
      listaDeDEspesa = controller.fetchCategories(false);
      if (mounted) {
        setState(() {});
      }
    });
    titleController.text = widget.finantialMovement?.description ?? '';
    valueController.text = (widget.finantialMovement?.value ?? '').toString();
    categoryController.text = widget.finantialMovement?.category.label ?? '';
    dateController.text = widget.finantialMovement?.paymentDate ?? '';
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    valueController.dispose();
    categoryController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _fetchCategories() async {
    await controller.cacheCategory();
    listaDeReceita = controller.fetchCategories(true);
    listaDeDEspesa = controller.fetchCategories(false);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formater = DateFormat('dd/MM/yyyy');
    final registerContextNavigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('${widget.title} movimentação financeira')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CustomSwitch(),
                const SizedBox(height: 16),
                CustomTextFormField(
                  icon: Icons.calendar_month,
                  label: 'Data',
                  readOnly: true,
                  controller: dateController,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    dateTime = await showDatePicker(
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                      context: context,
                    );
                    dateController.text =
                        formater.format(dateTime ?? DateTime.now());
                    setState(() {});
                  },
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('Calendário'),
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  icon: Icons.text_fields_sharp,
                  label: 'Título',
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  typeKeyboard: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  icon: Icons.monetization_on_outlined,
                  label: 'Valor',
                  controller: valueController,
                  textInputAction: TextInputAction.next,
                  typeKeyboard: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: isNewCategory,
                  child: CustomTextFormField(
                    icon: Icons.category_outlined,
                    label: 'Categoria',
                    controller: categoryController,
                    textInputAction: TextInputAction.next,
                    typeKeyboard: TextInputType.name,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isNewCategory,
                      child: CustomDropDownButton(
                          list: CustomSwitch.valueSwitch.value
                              ? listaDeReceita
                              : listaDeDEspesa),
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

                    var finantialMovement = FinantialMovement(
                      widget.finantialMovement?.id ?? '',
                      description: titleController.text,
                      value: double.tryParse(valueController.text) ?? 0,
                      userID: widget.userLogged?.id.toString() ?? '',
                      isIncome: CustomSwitch.valueSwitch.value,
                      paymentDate: dateController.text,
                      category: Category(
                        label: isNewCategory
                            ? categoryController.text
                            : CustomDropDownButton.dropDownValue ?? 'Extra',
                        image: CustomSwitch.valueSwitch.value
                            ? 'assets/income.png'
                            : 'assets/expense.png',
                        isIncome: CustomSwitch.valueSwitch.value,
                      ),
                    );

                    if (isFormValid ?? false) {
                      await controller.create(finantialMovement);

                      if (CustomSwitch.valueSwitch.value) {
                        if (!listaDeReceita
                            .contains(finantialMovement.category.label)) {
                          await controller
                              .saveCategory(finantialMovement.category);
                        }
                      } else {
                        if (!listaDeDEspesa
                            .contains(finantialMovement.category.label)) {
                          await controller
                              .saveCategory(finantialMovement.category);
                        }
                      }
                      registerContextNavigator.pushNamed(
                        '/home',
                        arguments: widget.userLogged,
                      );
                    }
                  },
                  child: Text(widget.title),
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
