import 'package:flutter/material.dart';

class Bodytest extends StatelessWidget {
  const Bodytest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Últimas Transações',
                style: Theme.of(context).textTheme.headline2,
              ),
              const Icon(
                Icons.arrow_circle_right_outlined,
                size: 36,
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Image.asset('assets/income.png'),
            trailing: const Text('R\$'),
            title: const Text('Salário'),
            subtitle: const Text('Data, Hora'),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Image.asset('assets/expense.png'),
            title: const Text('Produtos Eletrônicos'),
            subtitle: const Text('Data, Hora'),
            trailing: const Text('R\$'),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Image.asset('assets/income.png'),
            trailing: const Text('R\$'),
            title: const Text('Jogo do Bicho'),
            subtitle: const Text('Data, Hora'),
          ),
        )
      ],
    );
  }
}
