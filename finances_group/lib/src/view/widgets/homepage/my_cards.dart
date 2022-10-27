import 'package:flutter/material.dart';
import 'package:flutter_credit_card_brazilian/credit_card_widget.dart';
import 'package:flutter_credit_card_brazilian/flutter_credit_card.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cartões',
                style: Theme.of(context).textTheme.headline2,
              ),
              const Icon(
                Icons.arrow_circle_right_outlined,
                size: 36,
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CreditCardWidget(
                  cardNumber: '5555 4875 6521 1725',
                  expiryDate: '12/2025',
                  cardHolderName: 'Antônio Carlos Ferreira',
                  cvvCode: '123',
                  height: 250,
                  width: myWidth * 0.85,
                  cardType: CardType.visa,
                  showBackView:
                      false, //true when you want to show cvv(back) view
                ),
                CreditCardWidget(
                  cardNumber: '6847 2487 0241 3849',
                  expiryDate: '06/2029',
                  cardHolderName: 'Silas Cardoso Genro',
                  cvvCode: '321',
                  height: 250,
                  width: myWidth * 0.85,
                  cardType: CardType.mastercard,
                  cardBgColor: Colors.amber.shade700,
                  showBackView:
                      false, //true when you want to show cvv(back) view
                ),
                CreditCardWidget(
                  cardNumber: '1874 9564 2050 9475',
                  expiryDate: '01/2024',
                  cardHolderName: 'João Fernandes Pires',
                  cvvCode: '456',
                  height: 250,
                  width: myWidth * 0.85,
                  cardType: CardType.americanExpress,
                  cardBgColor: Colors.grey.shade800,

                  showBackView:
                      false, //true when you want to show cvv(back) view
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
