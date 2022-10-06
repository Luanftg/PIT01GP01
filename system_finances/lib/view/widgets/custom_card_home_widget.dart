import 'package:flutter/material.dart';
import 'package:system_finances/view/components/home/custom_linear_accounts.dart';

class CustomCardHomeWidget extends StatelessWidget {
  final double saldo;
  final String caminhoDaImagem;
  final String nomeDaConta;
  final String tipoDeConta;

  const CustomCardHomeWidget(
      {Key? key,
      required this.saldo,
      required this.caminhoDaImagem,
      required this.nomeDaConta,
      required this.tipoDeConta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset.zero,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 8,
                      color: Colors.green,
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: Column(
                        children: const [
                          Text('Saldo geral',
                              style: TextStyle(
                                color: Colors.black54,
                                decoration: TextDecoration.none,
                                fontSize: 16,
                              )),
                          Text(
                            'R\$ 18.212,23',
                            style: TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.none,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 16, 0),
                  child: Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          //const Spacer(),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              //const SizedBox(height: 8),
              Text('Minhas Contas',
                  style: Theme.of(context).textTheme.titleMedium),
              //const SizedBox(height: 8),
              CustomLinearAccounts(
                caminhoDaImagem: caminhoDaImagem,
                nomeDaConta: nomeDaConta,
                tipoDeConta: tipoDeConta,
                valor: '$saldo',
              ),
              const Divider(),
              const CustomLinearAccounts(
                  caminhoDaImagem:
                      'https://play-lh.googleusercontent.com/pTvc9kCumx_24eJDwGUpvcBwljcIBkrsL3qHwhBW2NalMQ-XxTtHRV9YAJanBxkV0Rw',
                  nomeDaConta: 'PicPay',
                  tipoDeConta: 'Conta-Corrente',
                  valor: '3.252,44'),
            ],
          ),
          //const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 20), primary: Colors.green),
            onPressed: () {},
            child: const Text('Gerenciar Contas'),
          ),
        ],
      ),
    );
  }
}
