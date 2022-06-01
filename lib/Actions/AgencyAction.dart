import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Agency.dart';


String serverHost = "localhost";

/// AGENCY Create POST
/// Creating an agency requires an [Agency] object sent from BODY
Future<Agency> createAgency(Agency newAgency) async {
  Uri url = Uri.parse("https://$serverHost:7210/api/agency");
  var response = await http.post(url, body: newAgency);

  // TODO: remove 200 or 201 statuscode check

  if(response.statusCode == 200 || response.statusCode == 201){
    return Agency.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('failed to fetch Agency');
  }
}

/// AGENCY READ GET
Future<List<Agency>> getAgencyList() async {
  var response = await http.get(Uri.parse("https://$serverHost:7210/api/agency"));

  List decodedResponse = json.decode(response.body) as List;

  List<Agency> parsed = [];

  print("just fetched data");
  print("Data is ${decodedResponse.first}");

  for(int x = 0; x< decodedResponse.length;x++){

    parsed.add(Agency.fromJson(decodedResponse[x]));
  }

  print(parsed.first);
  return parsed;
}


/// AGENCIES READ


Future<Agency> getAgencyById(int id) async {

  var response = await http.get(Uri.parse("https://$serverHost:7210/api/agency/$id"));

  var decodedResponse = json.decode(response.body);

  return decodedResponse;

  /*  var response = await http.get(Uri.parse("https://$serverHost:7210/api/agency/$id"));
  if(response.statusCode == 200 || response.statusCode == 201){
    return Agency.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('failed to fetch Agency by id: $id');
  }*/
}



/// AGENCY UPDATE PUT
/// The only editable attr in [Agency] is the name
// TODO: might have to chane this one
// TODO: Agent and property needs to made editable in api later

Future<http.BaseResponse> updateAgencyById(int id, String newName) async {
  var url = Uri.parse("https://$serverHost:7210/api/agency/$id");
  var onlineAgency = await http.put(url, body: newName);
  return onlineAgency;
}


/// AGENCY Delete
Future<http.BaseResponse> deleteAgencyById(int id) async {
  var response = await http.delete(Uri.parse("https://$serverHost:7210/api/agency/$id"));

  if(response.statusCode == 200 || response.statusCode == 201){
    return response;
  }else{
    throw Exception('failed to delete Agency ');
  }
}
