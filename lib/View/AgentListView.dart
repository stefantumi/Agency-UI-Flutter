import 'package:flutter/material.dart';

import '../Models/Agent.dart';


class AgentListView extends StatelessWidget {
  const AgentListView({Key? key, required this.title, required this.agents}) : super(key: key);
  final List<Agent> agents;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: agents.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index){
            var agent = agents[index];

            return ListTile(
              title: Text(agent.firstName + agent.lastName),
              leading: const CircleAvatar(),
              onTap: (){
                /*Navigator.pushNamed(context, '/agent_details', arguments: agent);*/
              },
            );
          }
      ),
    );
  }
}
