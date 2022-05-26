import 'dart:convert';

import 'Property.dart';
import 'APerson.dart';

class Agent extends Person{
  final List<Property> catalogue;

  Agent({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.ssid,
    required this.catalogue
  });

  factory Agent.fromJson(String str) => Agent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Agent.fromMap(Map<String, dynamic> json) => Agent(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    ssid: json["ssid"],
    catalogue: List<Property>.from(json["catalogue"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "FirstName": firstName,
    "LastName": lastName,
    "SSID": ssid,
    "Catalogue": List<Property>.from(catalogue.map((x) => x)),
  };
}
