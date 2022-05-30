
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
    required this.id,
    required this.address,
    required this.size,
    required this.price,
    this.owner,
    this.buyer,
  });

  factory Property.fromJson(Map<dynamic, dynamic> json) {
    return Property(
      id: json["id"],
      address: Address.fromJson(json["address"]),
      size: json["size"],
      price: json["price"],
      owner: Owner.fromJson(json["Owner"]),
      buyer: Buyer.fromJson(json["Buyer"]),
    );
  }

  Map<dynamic, dynamic> toMap() => {
    "id" : id ,
    "address": address ,
    "size" : size ,
    "price" : price ,
    "Owner" : owner ,
    "Buyer": buyer ,
  };

}