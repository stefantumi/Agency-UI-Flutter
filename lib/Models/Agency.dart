import 'dart:convert';

import 'Agent.dart';
import 'Property.dart';



class Agency {
  final int id;
  final String name;
  final List<Property>? properties;
  final List<Agent>? agents;

  Agency({
    required this.id,
    required this.name,
    this.properties,
    this.agents,
  });


  factory Agency.fromJson(Map<dynamic, dynamic> json) {
    return Agency(
      id: json["id"],
      name: json["name"],
      /*properties: List<Property>.from(json["Properties"].map((x) => x)),*/
      /*agents: List<Agent>.from(json["Agents"].map((x) => x)),*/
    );
  }

  /*Map<String, dynamic> toMap() => {
    "id": id,
    "Name": name,
    "Properties": agents == null ? null : List<Property>.from(properties!.map((x) => x)),
    "Agents": agents == null ? null : List<Agent>.from(agents!.map((x) => x)),
  };
*/
}
