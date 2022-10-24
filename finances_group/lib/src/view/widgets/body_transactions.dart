import 'package:flutter/material.dart';

class BodyTransactions extends StatelessWidget {
  const BodyTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                leading: Text(
                  'Últimas Transações',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_circle_right_outlined, size: 36),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Image.asset('assets/income.png'),
                  trailing: const Text('R\$'),
                  title: const Text('Salário'),
                  subtitle: const Text('Data, Hora'),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Image.asset('assets/expense.png'),
                  title: const Text('Produtos Eletrônicos'),
                  subtitle: const Text('Data, Hora'),
                  trailing: const Text('R\$'),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Image.asset('assets/income.png'),
                  trailing: const Text('R\$'),
                  title: const Text('Jogo do Bicho'),
                  subtitle: const Text('Data, Hora'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
