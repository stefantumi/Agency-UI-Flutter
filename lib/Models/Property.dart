
import 'Address.dart';
import 'Buyer.dart';
import 'Owner.dart';

class Property {
  final int? id;
  final Address address;
  final double size;
  final double price;
  final Owner? owner;
  final Buyer? buyer;

  Property({
    this.id,
    required this.address,
    required this.size,
    required this.price,
    this.owner,
    this.buyer,
  });

  factory Property.fromJson(Map<dynamic, dynamic> json) {
    return Property(
      id: json["id"] == null ? null : json['id'],
      address: Address.fromJson(json["address"]),
      size: json["size"],
      price: json["price"],
      owner: json['Owner'] == null ? null : Owner.fromJson(json["Owner"]),
      buyer: json['Buyer'] == null ? null : Buyer.fromJson(json["Buyer"]),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
    "address": address.toMap(),
    "size" : size,
    "price" : price,
    "Owner" : owner,
    "Buyer": buyer
  };

}