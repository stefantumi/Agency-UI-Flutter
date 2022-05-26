import 'dart:convert';


import 'Address.dart';
import 'Agent.dart';
import 'Buyer.dart';
import 'Owner.dart';

class Property {
  final int id;
  final Address address;
  final int size;
  final int price;
  final Owner owner;
  final Buyer buyer;

  Property({
    required this.id,
    required this.address,
    required this.size,
    required this.price,
    required this.owner,
    required this.buyer,
  });


  factory Property.fromJson(String str) => Property.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Property.fromMap(Map<dynamic, dynamic> json) => Property(
    id: json["id"],
    address: Address.fromMap(json["address"]),
    size: json["size"],
    price: json["price"],
    owner: Owner.fromJson(json["Owner"]),
    buyer: Buyer.fromJson(json["Buyer"]),
  );

  Map<dynamic, dynamic> toMap() => {
    "id": id,
    "address": address.toMap(),
    "size": size,
    "price": price,
    "owner": owner.toMap(),
    "buyer": buyer.toMap(),
  };
}