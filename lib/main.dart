import 'package:flutter/material.dart';
import 'package:framer_app_card_clone/model/card.dart';
import 'package:framer_app_card_clone/widgets/bill_list_tile.dart';
import 'package:framer_app_card_clone/widgets/card_list_tile.dart';
import 'package:framer_app_card_clone/widgets/cards_carrossel.dart';
import 'package:framer_app_card_clone/mock/cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<CreditCard> _cards = CardsMock().cards;
  late PageController _pageController;
  int index = 0;

  onPageChanged(int? index) {
    setState(() {
      this.index = index!;
    });
  }

  @override
  void initState() {
    super.initState();
    setPageController(index);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController.addListener(() {
      setState(() {
        setPageController(index,
            viewPort: 0.7 + (0.3 * _animationController.value));
      });
    });
  }

  void setPageController(int index, {double viewPort = 0.7}) {
    _pageController =
        PageController(viewportFraction: viewPort, initialPage: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3 -
                    ((MediaQuery.of(context).size.height * 0.2) *
                        _animationController.value),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                        opacity: _animationController.value,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            AppBar(
                                title: Text(_cards[index].name!),
                                centerTitle: true,
                                backgroundColor: Colors.black),
                            GestureDetector(
                              onTap: () {
                                setPageController(index);
                                _animationController.animateTo(0);
                              },
                              child: Container(
                                alignment: Alignment.bottomRight,
                                width: 50,
                                height: 30,
                                margin: EdgeInsets.only(top: 15),
                                child: Icon(Icons.arrow_back,
                                    color: Colors.white, size: 30),
                              ),
                            )
                          ],
                        )),
                    Opacity(
                      opacity: 1 - _animationController.value,
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: _animationController.value * 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Current Balance",
                                style: TextStyle(color: Colors.white)),
                            Text(
                              "\$${_cards[index].balance}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 28),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: _animationController.value == 0.0 ? 0 : 1,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(
                            -90 * _animationController.value / 360),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.55,
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: RotatedBox(
                              quarterTurns: 45,
                              child: CardListTile(card: _cards[index])),
                        ),
                      ),
                    ),
                    IgnorePointer(
                      ignoring: _animationController.value >= 0.3,
                      child: Opacity(
                        opacity: 1 - _animationController.value,
                        child: CardsCarrossel(
                            cards: _cards,
                            pageController: _pageController,
                            onChangeIndex: onPageChanged,
                            currentIndex: index,
                            animValue: _animationController.value,
                            openCard: () {
                              _animationController.animateTo(1);
                            }),
                      ),
                    )
                  ],
                )),
            Container(
                height: MediaQuery.of(context).size.height * 0.2 +
                    ((MediaQuery.of(context).size.height * 0.25) *
                        _animationController.value),
                child: _animationController.value > 0.0
                    ? Container(
                        margin: EdgeInsets.only(top: 200 - (200 * _animationController.value)),
                        padding: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: ListView.builder(
                            itemCount: _cards[index].bills!.length,
                            itemBuilder: (context, index) {
                              return BillListTile(
                                  bill: _cards[this.index].bills![index]);
                            }),
                      )
                    : Center(
                        child: FloatingActionButton(
                            backgroundColor: Colors.grey[800],
                            onPressed: () {
                              print("add new Button");
                            },
                            child: Icon(Icons.add))))
          ],
        ));
  }
}
