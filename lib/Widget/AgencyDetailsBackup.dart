import 'package:agencyui/Actions/AgencyAction.dart';
import 'package:agencyui/Models/Agency.dart';
import 'package:agencyui/Models/Property.dart';
import 'package:agencyui/Widget/Forms/AgentForm.dart';
import 'package:agencyui/Widget/Forms/Property/PropertyForm.dart';
import 'package:agencyui/Widget/Forms/Property/PropertyFormCreate.dart';
import 'package:flutter/material.dart';


class AgencyDetails extends StatefulWidget {
  const AgencyDetails({Key? key, required this.agency}) : super(key: key);
  final Agency agency;
  /*final int agencyId;*/
  @override
  State<AgencyDetails> createState() => _AgencyDetailsState();
}

class _AgencyDetailsState extends State<AgencyDetails> {
  /*late Future<Agency> futureAgency;*/

/*  @override
  initState(){
    super.initState();
    futureAgency = getAgencyById(widget.agencyId);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('name'),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
          ],
        ),
        body: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    color: Colors.blue,
                    child: Center(
                      child: Text(widget.agency.name.toString(), style: const TextStyle(fontSize: 40)),
                    ),
                  ),
                ),
                Properties(property: widget.agency.properties!),
                Agents(agents: widget.agency.agents!)

              ],
            ),
          )
        )
    );
  }
}

class Properties extends StatelessWidget {
  const Properties({Key? key, required this.property}) : super(key: key);

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
                        leading: CircleAvatar(
                          child: Text(property[index]['id'].toString()),
                        ),
                        trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              propertyDialog(context, property[index]);
                            }
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
                    return ListTile(
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
