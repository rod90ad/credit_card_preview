import 'package:framer_app_card_clone/mock/bills.dart';
import 'package:framer_app_card_clone/model/card.dart';

class CardsMock {
  final List<CreditCard> cards = [
    CreditCard.fromMap({
      "balance": 11573.0,
      "cardNumber": 1234567812341066,
      "flag": "master",
      "name": "Main Card",
      "colors": "puple",
      "bills": BillsMock().getBills()
    }),
    CreditCard.fromMap({
      "balance": 5503.0,
      "cardNumber": 1234567812341589,
      "flag": "visa",
      "name": "Secondary Card",
      "colors": "blue",
      "bills": BillsMock().getBills()
    }),
    CreditCard.fromMap({
      "balance": 1560.0,
      "cardNumber": 1234567812343008,
      "flag": "master",
      "name": "Son Card",
      "colors": "black",
      "bills": BillsMock().getBills()
    }),
    CreditCard.fromMap({
      "balance": 6830.0,
      "cardNumber": 1234567812341907,
      "flag": "visa",
      "name": "Wife Card",
      "colors": "purple",
      "bills": BillsMock().getBills()
    })
  ];

}