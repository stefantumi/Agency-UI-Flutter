import 'dart:convert';

class Address {
  final int id;
  final String street;
  final int houseNo;
  final int zip;

  Address({
    required this.id,
    required this.street,
    required this.houseNo,
    required this.zip,
  });

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    id: json["id"],
    street: json["street"],
    houseNo: json["houseNo"],
    zip: json["zip"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "street": street,
    "houseNo": houseNo,
    "zip": zip,
  };
}