class Data {
  int id;
  String last_updated;

  String created_at;
  String txn_id;
  double kwh;
  String start_datetime;
  String end_datetime;
  double total_cost;
  String location_name;
  Data({
     this.created_at,
     this.last_updated,
     this.location_name,
     this.id,
     this.end_datetime,
     this.start_datetime,
     this.total_cost,
     this.txn_id,
     this.kwh,
  });

  factory Data.fromMap(Map<dynamic, dynamic> parsedJson) {
    return Data(
        created_at: parsedJson["created_at"],
        last_updated: parsedJson["last_updated"],
        location_name: parsedJson["location_name"],
        id: parsedJson["id"],
        end_datetime: parsedJson["end_datetime"],
        start_datetime: parsedJson["start_datetime"],
        total_cost: parsedJson["total_cost"],
        txn_id: parsedJson["txn_id"],
        kwh: parsedJson["kwh"]);
  }
}
