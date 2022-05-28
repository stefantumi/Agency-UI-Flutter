import 'dart:convert';

import 'Agent.dart';
import 'Property.dart';



class Agency {
  final int id;
  final String name;
  final List<dynamic>? properties;
  final List<dynamic>? agents;

  Agency({
    required this.id,
    required this.name,
    this.properties,
    this.agents,
  });


  /*for (var element in data) {
  ages.add(Agency.fromJson(element));
  }*/


  factory Agency.fromJson(Map<dynamic, dynamic> json) {
    return Agency(
      id: json["id"],
      name: json["name"],
      properties: json['properties'], //List<Property>.from(json["Properties"].map((property) => Property.fromJson(property))),
      agents: json['agents'] //List<Agent>.from(json["Agents"].map((agent) => Agent.fromJson(agent))),
    );
  }
/*
  factory Agency.fromJsonList(List<Map<String, dynamic>> json ) {

    List<Agency> agencies = [];

    json.forEach((element) { agencies.add(Agency.fromJson(element));});

  }*/

  /*Map<String, dynamic> toMap() => {
    "id": id,
    "Name": name,
    "Properties": agents == null ? null : List<Property>.from(properties!.map((x) => x)),
    "Agents": agents == null ? null : List<Agent>.from(agents!.map((x) => x)),
  };
*/
}
