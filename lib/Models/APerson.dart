import 'dart:convert';

abstract class Person{
  final int id;
  final String firstName;
  final String lastName;
  final String ssid;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.ssid,
  });

}

