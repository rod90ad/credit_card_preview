import 'package:flutter/material.dart';
import 'package:framer_app_card_clone/model/card.dart';
import 'package:framer_app_card_clone/widgets/card_list_tile.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key, required this.card}) : super(key: key);

  final CreditCard card;

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(widget.card.name!),
          backgroundColor: Colors.black,
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: CardListTile(
                    card: widget.card),
              )),
          Expanded(flex: 6, child: SingleChildScrollView())
        ],
      ),
    );
  }
}
