import 'dart:convert';

import 'APerson.dart';
import 'Property.dart';

class Owner extends Person{
  final List<Property> property;

  Owner({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.ssid,
    required this.property,
    });

/*  factory Owner.fromJson(String str) => Owner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());*/

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    ssid: json["ssid"],
    property: List<Property>.from(json["property"].map((x) => x)),
  );

  @override
  Map<String, dynamic> toMap() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "ssid": ssid,
    "property": List<Property>.from(property.map((x) => x)),
  };
}



