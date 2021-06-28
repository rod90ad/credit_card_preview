import 'package:flutter/material.dart';
import 'package:framer_app_card_clone/model/card.dart';
import 'package:framer_app_card_clone/widgets/card_list_tile.dart';

class CardsCarrossel extends StatefulWidget {
  final List<CreditCard> cards;
  final PageController pageController;
  final void Function(int)? onChangeIndex;
  final Function openCard;
  final int currentIndex;
  final double animValue;
  const CardsCarrossel(
      {Key? key,
      required this.cards,
      required this.pageController,
      required this.onChangeIndex,
      required this.currentIndex,
      required this.openCard,
      required this.animValue})
      : super(key: key);

  @override
  _CardsCarrosselState createState() => _CardsCarrosselState();
}

class _CardsCarrosselState extends State<CardsCarrossel> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: widget.pageController,
        itemCount: widget.cards.length,
        onPageChanged: widget.onChangeIndex,
        itemBuilder: (ctx, index) {
          return Opacity(
            opacity: resolveOpacity(index),
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: widget.currentIndex == index ? 0 : 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              duration: Duration(milliseconds: 200),
              child: GestureDetector(
                onTap: () {
                  widget.openCard();
                },
                child: RotatedBox(
                    quarterTurns: 45,
                    child: CardListTile(card: widget.cards[index])),
              ),
            ),
          );
        });
  }

  double resolveOpacity(int index) {
    if (index == widget.currentIndex){
      if (widget.animValue > 0.0)
        return 0;
      else
        return 1;
    }else
      return 1.0;
  }
}
