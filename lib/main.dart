import 'dart:io';

import 'package:agencyui/View/AgencyListView.dart';
import 'package:agencyui/View/LoginView.dart';
import 'package:agencyui/Widget/AgencyDetails.dart';
import 'package:agencyui/cert.dart';
import 'package:flutter/material.dart';

void main() {

  HttpOverrides.global = MyHttpOverrides();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginView(),
        '/agency_listveiw': (BuildContext context) => const AgencyListView(title: 'title'),
        '/agency_details': (BuildContext context) => const AgencyDetails()
      },
      home: Scaffold(
        drawer: NavigationRail(
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.abc), label: Text("prufa")),
            NavigationRailDestination(
                icon: Icon(Icons.abc), label: Text("prufa")),
            NavigationRailDestination(
                icon: Icon(Icons.abc), label: Text("prufa"))
          ],
          selectedIndex: 2,
        ),
        appBar: AppBar(),

      ),
    );
  }
}

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: const [
            Text("this is the landing view"),
            Text("1"),
            Text("2")
          ],
        ),
      ),
    );
  }
}
