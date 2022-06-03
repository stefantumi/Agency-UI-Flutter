import 'package:agencyui/Actions/AgencyAction.dart';
import 'package:agencyui/Actions/PropertyActions.dart';
import 'package:agencyui/Models/Agency.dart';
import 'package:agencyui/Models/Property.dart';
import 'package:agencyui/Widget/Forms/AgentForm.dart';
import 'package:agencyui/Widget/Forms/Property/PropertyForm.dart';
import 'package:agencyui/Widget/Forms/Property/PropertyFormCreate.dart';
import 'package:flutter/material.dart';


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
            IconButton(onPressed: (){}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: (){
            },
              icon: const Icon(Icons.refresh),)
          ],
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<Agency>(
            future: futureAgency,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Card(
                          color: Colors.blue,
                          child: Center(
                              child: Text(snapshot.data!.name.toString(), style: const TextStyle(fontSize: 40)),
                          ),
                        ),
                      ),
                      AgencyProperties(property: snapshot.data!.properties!),
                      Agents(agents: snapshot.data!.agents!)

                    ],
                  ),
                );
              } else if( snapshot.hasError){
                return Center(child: Text("Failed to retrieve Agency ${snapshot.error}"));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
    );
  }
}

class AgencyProperties extends StatelessWidget {
  const AgencyProperties({Key? key, required this.property}) : super(key: key);

  final List<dynamic> property;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Properties", style: TextStyle(fontSize: 30),),
                IconButton(onPressed: (){
                  propertyDialogCreate(context);
                },
                    icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: property.length,
                  itemBuilder: (BuildContext context, index){
                    return ListTile(
                        title: Text(property[index]['address']['street'].toString()),
                        contentPadding: const EdgeInsets.all(8),
                        leading: CircleAvatar(
                          child: Text(property[index]['id'].toString()),
                        ),
                        // TODO: change to a split button with delete or edit choice
                        trailing: TextButton(
                          child: const Icon(Icons.edit),
                          onPressed: (){
                            propertyDialog(context, property[index]);
                          },
                          onLongPress: (){
                            TextStyle buttonTextStyle = const TextStyle(
                              fontSize: 24
                            );
                            showModalBottomSheet(
                                context: context,
                                builder: (context){
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Are you sure you want to delete this property?" , style: buttonTextStyle),
                                        const Text("You will not be notified of success or failure, You will need to reload the for updated content"),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Cancel" , style: buttonTextStyle)),
                                              TextButton(
                                                  onPressed: (){
                                                    // TODO: inform user of success or failure
                                                    // TODO: implement action to refresh acestor widget
                                                    deletePropertyById(int.parse(property[index]['id'].toString()));
                                                    Navigator.of(context).pop();
                                              },
                                                  child: Text("Confirm", style: buttonTextStyle,))

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                );
                          }
                        )
                    );
                  }
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class Agents extends StatelessWidget {
  const Agents({Key? key, required this.agents}) : super(key: key);

  final List<dynamic> agents;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Column(
        children: [
          const Text("Agents",
            style: TextStyle(
                fontSize: 30
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: agents.length,
                  itemBuilder: (BuildContext context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ListTile(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          leading: CircleAvatar(
                            child:  Text(agents[index]['id'].toString()),
                          ),
                          title: Column(
                            children: [
                              Text(agents[index]['firstName'].toString()),
                              Text(agents[index]['lastName'].toString())
                            ],
                          ),
                          trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {
                            agentDialog(context, agents[index]);
                          },
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
