import 'APerson.dart';

class Buyer extends Person{

  Buyer({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.ssid,
  });


/*  factory Buyer.fromJson(String str) => Buyer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());*/

  factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    ssid: json["ssid"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "ssid": ssid,
  };
}
