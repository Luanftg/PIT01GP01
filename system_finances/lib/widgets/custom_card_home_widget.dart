import 'package:flutter/material.dart';

class CustomCardHomeWidget extends StatefulWidget {
  const CustomCardHomeWidget({Key? key}) : super(key: key);

  @override
  State<CustomCardHomeWidget> createState() => _CustomCardHomeWidgetState();
}

class _CustomCardHomeWidgetState extends State<CustomCardHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                    const VerticalDivider(
                      color: Colors.lightGreenAccent,
                      indent: 8,
                      endIndent: 200,
                      thickness: 5,
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 20), primary: Colors.lightGreen),
            onPressed: () {},
            child: const Text('Gerenciar Contas'),
          ),
        ],
      ),
    );
  }
}
