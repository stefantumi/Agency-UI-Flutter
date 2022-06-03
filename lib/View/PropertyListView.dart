import 'package:agencyui/Actions/PropertyActions.dart';
import 'package:agencyui/Widget/Forms/Property/PropertyForm.dart';
import 'package:flutter/material.dart';

import '../Models/Property.dart';


class PropertyListView extends StatefulWidget {
  const PropertyListView({Key? key}) : super(key: key);

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
      body: FutureBuilder<List<dynamic>>(
        future: futureProperties,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  Property property = snapshot.data[index];
                  return ListTile(
                    dense: true,
                    isThreeLine: true,
                    title: Text(property.address.street.toString()),
                    subtitle: Text("House Number: ${property.address.houseNo.toString()} ZIP: ${property.address.zip.toString()}"),
                    leading: CircleAvatar(
                      child: Text(property.id.toString()),
                    ),
                    onTap: () {
                      propertyDialog(context, property.toMap());
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