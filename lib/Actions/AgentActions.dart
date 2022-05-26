import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/Agent.dart';

/// AGENT Create POST
/// Creating an Agent requires an [Agent] object sent from BODY
Future<Agent> createAgent(Agent newAgent) async {
  Uri url = Uri.parse("https://localhost:7210/api/agent");
  var response = await http.post(url, body: newAgent);

  // TODO: remove 200 or 201 statuscode check

  if(response.statusCode == 200 || response.statusCode == 201){
    return Agent.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('failed to fetch AGENT');
  }
}

/// AGENT READ GET
Future<List<Agent>> getAgentList() async {
  var response = await http.get(Uri.parse("https://localhost:7210/api/agent"));

  if(response.statusCode == 200 || response.statusCode == 201){
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

/*    return (json.decode(response.body) as List)
        .map((e) => Agency.fromMap(e))
        .toList();*/

    return parsed.map<Agent>((json) => Agent.fromJson(json)).toList();
  }else{
    throw Exception('failed to fetch AGENT');
  }
}


/// AGENTS READ
Future<Agent> getAgentById(int id) async {
  var response = await http.get(Uri.parse("https://localhost:7210/api/agent/$id"));

  if(response.statusCode == 200 || response.statusCode == 201){
    return Agent.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('failed to fetch AGENT by id: $id');
  }
}



/// AGENT UPDATE PUT
/// The only editable attr in [Agent] is the name
// TODO: might have to chane this one
// TODO: Agent and property needs to made editable in api later

Future<http.BaseResponse> updateAgentById(int id, Agent updatedAgent) async {
  var url = Uri.parse("https://localhost:7210/api/agent/$id");
  var onlineAgent = await http.put(url, body: updatedAgent);
  return onlineAgent;
}


/// AGENT Delete
Future<http.BaseResponse> deleteAgentById(int id) async {
  var response = await http.delete(Uri.parse("https://localhost:7210/api/agent/$id"));

  if(response.statusCode == 200 || response.statusCode == 201){
    return response;
  }else{
    throw Exception('failed to delete Agent ');
  }
}
