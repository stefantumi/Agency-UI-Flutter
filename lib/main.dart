import 'dart:io';

import 'package:agencyui/View/LoginView.dart';
import 'package:agencyui/cert.dart';
import 'package:flutter/material.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginView(),
      },
    );
  }
}

