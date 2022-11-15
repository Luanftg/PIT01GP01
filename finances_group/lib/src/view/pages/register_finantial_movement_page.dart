import 'dart:developer';

import 'package:finances_group/src/controller/home_controller.dart';
import 'package:finances_group/src/data/repositories/finantial_movement_repository_local_imp.dart';
import 'package:finances_group/src/models/category.dart';

import 'package:finances_group/src/models/finantial_movement.dart';
import 'package:finances_group/src/models/user.dart';
import 'package:flutter/material.dart';

class RegisterFinantialMovementPage extends StatefulWidget {
  const RegisterFinantialMovementPage({super.key});

  @override
  State<RegisterFinantialMovementPage> createState() =>
      _RegisterFinantialMovementPageState();
}

class _RegisterFinantialMovementPageState
    extends State<RegisterFinantialMovementPage> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        HomeController(FinantialMovementRepositoryLocalImp());

    var titleController = TextEditingController();
    var bodyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Resty App')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
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
                label: const Text('Descrição:'),
              ),
              controller: bodyController,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                var finantialMovement = FinantialMovement(
                  description: titleController.text,
                  value: double.parse(bodyController.text),
                  userID: 1,
                  isIncome: true,
                  category: Category(label: 'Casa', color: Colors.blue),
                );
                var result = await homeController.create(finantialMovement);
                log(finantialMovement.toString());
                log(result.toString());
                if (result) {
                  var list = <FinantialMovement>[];
                  list.add(finantialMovement);
                  final user = User(
                    true,
                    uid: '1',
                  );
                  Navigator.pushNamed(context, '/home', arguments: user);
                }
              },
              child: const Text('Publicar post'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
