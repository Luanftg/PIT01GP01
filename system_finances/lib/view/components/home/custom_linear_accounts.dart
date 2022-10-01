// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:system_finances/view/components/home/custom_circular_contact_image.dart';

class CustomLinearAccounts extends StatelessWidget {
  final String valor;
  final String caminhoDaImagem;
  final String nomeDaConta;
  final String tipoDeConta;

  const CustomLinearAccounts({
    Key? key,
    required this.valor,
    required this.caminhoDaImagem,
    required this.nomeDaConta,
    required this.tipoDeConta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCircularContactImage(
              pathContactImage: caminhoDaImagem,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nomeDaConta,
                  style: const TextStyle(color: Colors.black87),
                ),
                Text(
                  tipoDeConta,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
        Text('R\$ $valor')
      ],
    );
  }
}
