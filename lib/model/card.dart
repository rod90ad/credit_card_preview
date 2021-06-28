import 'package:framer_app_card_clone/model/bill.dart';

class CreditCard {
  
  double? balance;
  int? cardNumber;
  String? flag;
  String? name;
  String? colors;
  List<Bill>? bills;

  CreditCard.fromMap(Map map){
    this.balance = map["balance"];
    this.cardNumber = map["cardNumber"];
    this.flag = map["flag"];
    this.name = map["name"];
    this.bills = map["bills"];
    this.colors = map["colors"];
  }

  String obfuscateCardNumber() {
    return "**** **** **** ${this.cardNumber.toString().substring(12)}";
  }

  Map toMap(){
    return { "balance": this.balance, "cardNumber": this.cardNumber, "flag": this.flag, "name": this.name, "colors": this.colors, "bills": this.bills?.map((e) => e.toMap()) };
  }
}