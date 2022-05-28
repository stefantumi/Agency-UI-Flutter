import 'package:agencyui/Actions/AgencyAction.dart';
import 'package:agencyui/Models/Agency.dart';
import 'package:flutter/material.dart';

import '../Models/Property.dart';


class AgencyDetails extends StatefulWidget {
  const AgencyDetails({Key? key, required this.agencyId}) : super(key: key);

  final int agencyId;

  @override
  State<AgencyDetails> createState() => _AgencyDetailsState();
}

class _AgencyDetailsState extends State<AgencyDetails> {
  late Future<Agency> futureAgency;

  @override
  initState(){
    super.initState();
    futureAgency = getAgencyById(widget.agencyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('name'),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
          ],
        ),
        body: FutureBuilder<Agency>(
          future: futureAgency,
          builder: (context, snapshot){
            print("snapshot: ${snapshot.data}");
            if(snapshot.hasData){
              return Card(
                child: Column(
                  children: [
                    Text(snapshot.data!.id.toString()),
                    Text(snapshot.data!.name),
                    Properties(property: snapshot.data!.properties!),
                    Text(snapshot.data!.agents.toString()),
                    // Text(snapshot.data!.properties.toString())
                  ],
                ),
              );
            } else if( snapshot.hasError){
              return Text("Failed to retrieve Agency ${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        )
    );
  }
}


class Properties extends StatelessWidget {
  const Properties({Key? key, required this.property}) : super(key: key);

  final List<dynamic> property;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          itemCount: property.length,
          itemBuilder: (BuildContext context, index){
            return ListTile(
              title: Card(
                child: Column(
                  children: [
                    Text(property[index]['id'].toString()),
                    Text(property[index]['address'].toString())
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}



/*
class PropertyListing extends StatefulWidget {
  const PropertyListing({Key? key,required this.properties}) : super(key: key);

  final List<Property> properties;

  @override
  State<PropertyListing> createState() => _PropertyListingState();
}

class _PropertyListingState extends State<PropertyListing> {

  @override
  initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.properties.length,
        itemBuilder: (BuildContext context, index) {
          // Property property =
          ListTile(
            title: Text(''),
          );
        }
    );
  }
}
*/


/*class AgencyDetails extends StatelessWidget {
  const AgencyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Agency agency = ModalRoute.of(context)!.settings.arguments as Agency;
    return Scaffold(
      appBar: AppBar(
        title: Text(agency.name),
        actions: [

          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ],
      ),
      body: FutureBuilder<Agency>(
        future: ,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Card(
                  child: Column(
                    children: [
                      Text(agency.id.toString()),

                      Text(agency.name),
                      Text(agency.agents.toString()),
                      Text(agency.properties.toString())
                    ],
                  ),
                );
              } else if( snapshot.hasError){
            return Text("Failed to retrieve Agency ${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      )
    );
  }
}*/
