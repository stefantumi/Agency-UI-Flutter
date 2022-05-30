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

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      id: json["id"],
      street: json["street"],
      houseNo: json["houseNo"],
      zip: json["zip"],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "street": street,
    "houseNo": houseNo,
    "zip": zip,
  };
}