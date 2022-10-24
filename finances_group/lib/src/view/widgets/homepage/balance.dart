import 'package:finances_group/src/view/components/user.dart';
import 'package:flutter/material.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Saldo geral',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.black,
                        )),
                    Text(
                        'R\$ ${users[0].balance!.toStringAsFixed(2).replaceFirst('.', ',')}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
                          color: Colors.black,
                        ))
                  ],
                ),
                IconButton(
                  onPressed: () => debugPrint('Visibily Icon'),
                  icon: const Icon(Icons.visibility),
                  color: const Color.fromRGBO(0, 0, 0, 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
