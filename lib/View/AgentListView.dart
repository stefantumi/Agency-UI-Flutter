import 'package:agencyui/Actions/AgentActions.dart';
import 'package:flutter/material.dart';

import '../Models/Agent.dart';


class AgentListView extends StatefulWidget {
  const AgentListView({Key? key}) : super(key: key);

  @override
  State<AgentListView> createState() => _AgencyListViewState();
}

class _AgencyListViewState extends State<AgentListView> {
  late Future<List<Agent>> futureAgents;

  @override
  void initState() {
    super.initState();
    futureAgents = getAgentList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Agent>>(
      future: futureAgents,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                Agent agent = snapshot.data[index];
                return ListTile(
                  title: Text("${agent.firstName} ${agent.lastName}"),
                  leading: const CircleAvatar(),
                  onTap: () {
                    Navigator.pushNamed(context, '/agent_details');
                  },
                );
              });
        } else if (snapshot.hasError) {

          return Text(snapshot.error.toString());

        }
        return const CircularProgressIndicator();
      },
    );
  }
}