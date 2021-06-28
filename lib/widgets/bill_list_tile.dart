import 'package:flutter/material.dart';
import 'package:framer_app_card_clone/model/bill.dart';

class BillListTile extends StatelessWidget {
  const BillListTile({Key? key, required this.bill}) : super(key: key);
  final Bill bill;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(flex: 2, child: getIcon(bill.type!)),
          Expanded(flex: 6, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bill.place!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              Text(formatDate(bill.date!), style: TextStyle(color: Colors.grey.shade400))
            ],
          )),
          Expanded(flex: 2, child: Text("-\$${bill.value}", style: TextStyle(color: Colors.white)))
        ],
      ),
    );
  }

  String formatDate(DateTime dateTime){
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    if(dateTime == today)
      return "Today";
    else if(dateTime == yesterday)
      return "Yesterday";
    else
      return "${getMonth(dateTime.month)} ${getDay(dateTime.day)}";
  }

  String getMonth(int month){
    switch(month){
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Ago";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "NaN";
    }
  }

  String getDay(int day){
    if(day == 1){
      return "1st";
    }else if(day == 2){
      return "2nd";
    }else if(day == 3){
      return "3rd";
    }else{
      return "${day}th";
    }
  }

  Widget getIcon(String type) {
    switch(type){
      case "food":
        return FloatingActionButton(onPressed: null, child: Icon(Icons.fastfood, color: Colors.white), backgroundColor: Colors.grey.shade500);
      case "music":
        return FloatingActionButton(onPressed: null, child: Icon(Icons.music_note, color: Colors.white), backgroundColor: Colors.grey.shade500);
      case "shopping":
        return FloatingActionButton(onPressed: null, child: Icon(Icons.shopping_bag, color: Colors.white), backgroundColor: Colors.grey.shade500);
      case "heath":
        return FloatingActionButton(onPressed: null, child: Icon(Icons.favorite, color: Colors.white), backgroundColor: Colors.grey.shade500);
      default:
        return FloatingActionButton(onPressed: null, child: Icon(Icons.place, color: Colors.white), backgroundColor: Colors.grey.shade500);
    }
    
  }
}
