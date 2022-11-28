import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/design/theme/text_theme.dart';
import 'package:flutter/material.dart';

class BodyTransactions extends StatelessWidget {
  final String fmImage;
  final String fmPrice;
  final Color fmColor;
  final String title;
  final String subtitle;
  const BodyTransactions(
      {Key? key,
      required this.fmImage,
      required this.fmPrice,
      required this.fmColor,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: (() {
              debugPrint('Transactions Page');
            }),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Últimas Transações',
                  style: CustomAppTextTheme.headline2,
                ),
                const Icon(
                  Icons.navigate_next,
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Image.asset(
              fmImage,
              width: 52,
            ),
            trailing: Text(
              'R\$ $fmPrice',
              style: TextStyle(color: fmColor),
            ),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Image.asset(
              'assets/icons/eletronics.png',
            ),
            title: const Text('Produtos Eletrônicos'),
            subtitle: const Text('Data, Hora'),
            trailing: const Text(
              '- R\$ 100,00',
              style: TextStyle(color: AppCustomColors.danger),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Image.asset('assets/icons/generic.png'),
            trailing: const Text(
              '+ R\$ 500,00',
              style: TextStyle(color: AppCustomColors.primary),
            ),
            title: const Text('Jogo do Bicho'),
            subtitle: const Text('Data, Hora'),
          ),
        )
      ],
    );
  }
}
