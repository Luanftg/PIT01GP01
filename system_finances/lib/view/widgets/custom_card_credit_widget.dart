import 'package:flutter/material.dart';
import 'package:system_finances/view/components/home/custom_circular_contact_image.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cartões de Crédito',
                  style: Theme.of(context).textTheme.headline6,
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ),
          Row(
            children: [
              const CustomCircularContactImage(
                pathContactImage:
                    'https://nubank.com.br/images/nu-icon.png?v=2',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'NuBank',
                      style: TextStyle(color: Colors.black87),
                    ),
                    Text(
                      'Mastercard Crédito',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(width: 85),
              Text(
                'Disponivel',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(width: 85),
              Text(
                'Fatura Atual',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          Row(
            children: const [
              SizedBox(width: 85),
              Text('R\$ 7.645,44',
                  style: TextStyle(color: Colors.black87, fontSize: 16)),
              SizedBox(width: 65),
              Text('R\$ 1.545,77',
                  style: TextStyle(color: Colors.red, fontSize: 16)),
            ],
          )
        ],
      ),
    );
  }
}
