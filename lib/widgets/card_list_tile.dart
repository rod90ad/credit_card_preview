import 'package:flutter/material.dart';
import 'package:framer_app_card_clone/model/card.dart';

class CardListTile extends StatelessWidget {
  const CardListTile(
      {Key? key, required this.card})
      : super(key: key);

  final CreditCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: resolveColor(card.colors!), begin: Alignment.bottomLeft, end: Alignment.topRight),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Text(card.obfuscateCardNumber(),
                    style: TextStyle(color: Colors.white))),
          ),
          Expanded(
              flex: 5,
              child: Container(
                width: 100,
              )),
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text("\$${card.balance?.toInt()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  )),
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    child: getCreditCardFlag(card.flag),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  List<Color> resolveColor(String colors){
    switch(colors){
      case "purple":
        return [
            Colors.purple.shade900,
            Colors.purple.shade800,
            Colors.purple.shade700,
            Colors.purple.shade500
          ];
      case "blue":
        return [
            Colors.blue.shade900,
            Colors.blue.shade800,
            Colors.blue.shade700,
            Colors.blue.shade500
          ];
      case "black":
        return [
            Colors.grey.shade900,
            Colors.grey.shade800,
            Colors.grey.shade700,
            Colors.grey.shade500
          ];
      default:
        return [
            Colors.purple.shade900,
            Colors.purple.shade800,
            Colors.purple.shade700,
            Colors.purple.shade500
          ];
    }
  }

  Widget getCreditCardFlag(String? flag) {
    switch (flag) {
      case "master":
        return Image.asset("images/master_card.png", width: 55, height: 40);
      case "visa":
        return Image.asset("images/visa.png", width: 55, height: 40);
      default:
        return Image.asset("images/master_card.png", width: 55, height: 40);
    }
  }
}
