import 'dart:convert';


import 'Address.dart';
import 'Buyer.dart';
import 'Owner.dart';

class Property {
  final int id;
  final Address address;
  final int size;
  final int? price;
  final Owner owner;
  final Buyer? buyer;

  Property({
    required this.id,
    required this.address,
    required this.size,
    this.price,
    required this.owner,
    this.buyer,
  });

  factory Property.fromJson(Map<dynamic, dynamic> json) {
    return Property(
      id: json["id"],
      address: Address.fromMap(json["address"]),
      size: json["size"],
      price: json["price"],
      owner: Owner.fromJson(json["Owner"]),
      buyer: Buyer.fromJson(json["Buyer"]),
    );
  }

}