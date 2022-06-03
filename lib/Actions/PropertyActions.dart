import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/Property.dart';

String serverHost = "localhost";

/// PROPERTY Create POST request to API
/// Creating an Property requires a [Property] object sent from BODY
Future createProperty(Property newProperty) async {
  var encoded = jsonEncode(newProperty.toMap());
  Uri url = Uri.parse("https://$serverHost:7210/api/property");
  var response = await http.post(url,headers: <String,String>
  {
    "Content-Type":"application/json"
  },
  body: encoded);

  if(response.statusCode == 201 || response.statusCode == 200) {
    // return response;
  }else{
    // return response;
  }
  // TODO: Add the property to the agency listing
  // TODO: return a [Response] so you can inform the user of success or failure (details about the failure)
}

/// PROPERTY READ GET
Future<List<Property>> getPropertyList() async {
  var response = await http.get(Uri.parse("https://$serverHost:7210/api/property"));

  if(response.statusCode == 200 || response.statusCode == 201){
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
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
/// The editable attr in [Property] are size and price, maybe address too ?

Future<http.Response> updatePropertyById(Map<String,dynamic> newProperty) async {
  int id = int.parse(newProperty['id'].toString());
  var url = Uri.parse("https://$serverHost:7210/api/property");

  var data =  json.encode(
      <String,dynamic>{
        "id":newProperty['id'],
        "address":<String,dynamic>{
          "street": newProperty['address']['street'].toString(),
          "houseNo": int.parse(newProperty['address']['houseNo']),
          "zip":int.parse(newProperty['address']['zip'])
        },
        "size":int.parse(newProperty['size']),
        "price":int.parse(newProperty['price'])
      }
  );

  var onlineProperty = await http.put(url,
    body: data,
    headers: <String,String>{
      "Content-Type":"application/json"
    },
    encoding: utf8
  );

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
