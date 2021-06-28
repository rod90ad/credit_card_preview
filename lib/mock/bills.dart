import 'package:framer_app_card_clone/model/bill.dart';

class BillsMock {
  List<Bill> getBills() {
    return [
      Bill.fromMap({
        "type": "food",
        "value": 10.58,
        "place": "McDonald's",
        "date": "2021-06-27"
      }),
      Bill.fromMap({
        "type": "music",
        "value": 9.99,
        "place": "Spotify",
        "date": "2021-06-26"
      }),
      Bill.fromMap({
        "type": "shopping",
        "value": 36.89,
        "place": "Acme Clothing",
        "date": "2021-06-26"
      }),
      Bill.fromMap({
        "type": "heath",
        "value": 104.00,
        "place": "Dentist Clinic",
        "date": "2021-06-17"
      }),
      Bill.fromMap({
        "type": "music",
        "value": 3.99,
        "place": "Patreon",
        "date": "2021-06-12"
      }),
    ];
  }
}
