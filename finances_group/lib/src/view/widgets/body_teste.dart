import 'package:finances_group/src/controller/home_controller.dart';
import 'package:finances_group/src/data/repositories/finantial_movement_repository_prefs_imp.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/models/user_model.dart';

import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';

import 'package:flutter/material.dart';

class BodyTeste extends StatelessWidget {
  final UserModel userLogged;
  final HomeController _controller =
      HomeController(FinantialMovementRepositoryPrefsImp());
  BodyTeste({Key? key, required this.userLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FinantialMovement>>(
      future: _controller.findAll(userLogged),
      builder: ((context, snapshot) {
        if (snapshot.hasData && snapshot.data == null) {
          return const Center(
            child: Text('Nenhuma Transação cadastrada!'),
          );
        }
        if (snapshot.hasError || snapshot.data.runtimeType == Null) {
          return const Center(
            child: Text('Erro ao tentar ler transações!'),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/icons/eletronics.png',
                    ),
                    title: Text(snapshot.data![index].description),
                    subtitle: Text(snapshot.data![index].value.toString()),
                    trailing: const Text(
                      '- R\$ 100,00',
                      style: TextStyle(color: AppCustomColors.danger),
                    ),
                  ),
                );
              }));
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
