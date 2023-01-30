import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finances_group/src/shared/utils/currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:finances_group/src/data/repositories/finantial_movement_repository_firestore.dart';
import 'package:finances_group/src/features/home/home_controller.dart';
import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/models/user_model.dart';
import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';

class CustomListViewBuilder extends StatefulWidget {
  final List<FinantialMovement> finantialMovementList;
  final UserModel userModel;

  const CustomListViewBuilder({
    Key? key,
    required this.finantialMovementList,
    required this.userModel,
  }) : super(key: key);

  @override
  State<CustomListViewBuilder> createState() => _CustomListViewBuilderState();
}

class _CustomListViewBuilderState extends State<CustomListViewBuilder> {
  final DateFormat formater = DateFormat('dd-MM-yyyy');

  final HomeController _controller = HomeController(
      FinantialMovementRepositoryFirestore(FirebaseFirestore.instance));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var finaltialMovementList = widget.finantialMovementList;
    return ListView.builder(
        itemCount: finaltialMovementList.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, snapshot) {
          if (finaltialMovementList.isNotEmpty) {
            return Dismissible(
              key: Key('item $snapshot'),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      var scaffoldContext = ScaffoldMessenger.of(context);
                      var navigatorContext = Navigator.of(context);
                      return AlertDialog(
                        title: const Text("Deletar Movimentação Financeira"),
                        content: const Text(
                            "Você confirma a Deleção desta Movimentação Financeira ?"),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("Sim"),
                            onPressed: () async {
                              await _controller.delete(
                                  widget.finantialMovementList[snapshot].id);
                              scaffoldContext.showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'movimentação: ${widget.finantialMovementList[snapshot].description} removida!'),
                                ),
                              );

                              navigatorContext.pushReplacementNamed('/home',
                                  result: true, arguments: widget.userModel);
                            },
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Não"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.of(context)
                      .pushNamed("/add-finantial-movement", arguments: {
                    "finantialMovement": widget.finantialMovementList[snapshot],
                    "userLoged": widget.userModel
                  });
                  return false;
                }
              },
              background: Container(
                padding: const EdgeInsets.all(16),
                color: AppCustomColors.secondary,
                child: Row(
                  children: const [
                    Icon(Icons.update),
                    Text("Editar"),
                  ],
                ),
              ),
              secondaryBackground: Container(
                padding: const EdgeInsets.all(16),
                color: AppCustomColors.danger,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.delete_forever_sharp),
                    Text("Apagar"),
                  ],
                ),
              ),
              child: Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Image.asset(
                    widget.finantialMovementList[snapshot].category.image!,
                  ),
                  title: Text(
                    widget.finantialMovementList[snapshot].description,
                    style: TextStyle(
                        color: widget
                            .finantialMovementList[snapshot].category.color),
                  ),
                  subtitle: Text(widget
                      .finantialMovementList[snapshot].paymentDate
                      .toString()),
                  trailing: (widget.finantialMovementList[snapshot].isIncome)
                      ? Text(
                          '+ R\$ ${Currency.moneyFormat(widget.finantialMovementList[snapshot].value.toStringAsFixed(2))}',
                          style: const TextStyle(color: AppCustomColors.cyan),
                        )
                      : Text(
                          '- R\$ ${Currency.moneyFormat(widget.finantialMovementList[snapshot].value.toStringAsFixed(2))}',
                          style: const TextStyle(color: AppCustomColors.danger),
                        ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
