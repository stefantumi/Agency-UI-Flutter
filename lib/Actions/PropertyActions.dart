import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/Property.dart';


String serverHost = "192.168.1.237";



/// PROPERTY Create POST
/// Creating an Property requires an [Property] object sent from BODY
Future<Property> createProperty(Property newProperty) async {
  Uri url = Uri.parse("https://$serverHost:7210/api/property");
  var response = await http.post(url, body: newProperty);

  // TODO: remove 200 or 201 statuscode check

  if(response.statusCode == 200 || response.statusCode == 201){
    return Property.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('failed to fetch Property');
  }
}

/// PROPERTY READ GET
Future<List<Property>> getPropertyList() async {
  var response = await http.get(Uri.parse("https://$serverHost:7210/api/property"));

  if(response.statusCode == 200 || response.statusCode == 201){
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

/*    return (json.decode(response.body) as List)
        .map((e) => Agency.fromMap(e))
        .toList();*/

    return parsed.map<Property>((json) => Property.fromJson(json)).toList();

  }else{
    throw Exception('failed to fetch Property');
  }
}


/// PROPERTIES READ
Future<Property> getPropertyById(int id) async {
  var response = await http.get(Uri.parse("https://$serverHost:7210/api/property/$id"));
  if(response.statusCode == 200 || response.statusCode == 201){
    return Property.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('failed to fetch Property by id: $id');
  }
}



/// PROPERTY UPDATE PUT
/// The only editable attr in [Property] is the name

Future<http.BaseResponse> updatePropertyById(int id, String newName) async {
  var url = Uri.parse("https://$serverHost:7210/api/Property/$id");
  var onlineProperty = await http.put(url, body: newName);
  return onlineProperty;
}


/// PROPERTY Delete
Future<http.BaseResponse> deletePropertyById(int id) async {
  var response = await http.delete(Uri.parse("https://$serverHost:7210/api/property/$id"));

  if(response.statusCode == 200 || response.statusCode == 201){
    return response;
  }else{
    throw Exception('failed to delete Property ');
  }
}
