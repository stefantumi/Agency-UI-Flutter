
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


  factory Agency.fromJson(Map<String, dynamic> jsonData) {
    return Agency(
      id: jsonData["id"],
      name: jsonData["name"],
      properties: jsonData['properties'],
      agents: jsonData['agents']
    );
  }

  Map<String, dynamic> toMap() => {
    "id" : id,
    "name" : name,
    "properties" : properties,
    "agents" : agents
  };
}
