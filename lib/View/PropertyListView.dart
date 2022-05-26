import 'package:agencyui/Actions/PropertyActions.dart';
import 'package:flutter/material.dart';

import '../Models/Property.dart';


class PropertyListView extends StatefulWidget {
  const PropertyListView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PropertyListView> createState() => _PropertyListViewState();
}

class _PropertyListViewState extends State<PropertyListView> {
  late Future<List<Property>> futureProperties;

  @override
  void initState() {
    super.initState();
    futureProperties = getPropertyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Property>>(
        future: futureProperties,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  Property property = snapshot.data[index];
                  print("property from builder $property");
                  return ListTile(
                    title: Text(property.id.toString()),
                    leading: const CircleAvatar(),
                    onTap: () {
                      Navigator.pushNamed(context, '/property_details',
                          arguments: property);
                    },
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}