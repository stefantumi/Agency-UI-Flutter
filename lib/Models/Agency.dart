

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



  factory Agency.fromJson(Map<dynamic, dynamic> json) {
    return Agency(
      id: json["id"],
      name: json["name"],
      properties: json['properties'],
      agents: json['agents']
    );
  }
}
