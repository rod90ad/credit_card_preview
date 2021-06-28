class Bill {

  String? type;
  double? value;
  String? place;
  DateTime? date;

  Bill.fromMap(Map map){
    this.type = map["type"];
    this.value = map["value"];
    this.place = map["place"];
    this.date = DateTime.parse(map["date"]);
  }

  Map toMap(){
    return { "value": this.value, "place": this.place, "date": this.date };
  }
}