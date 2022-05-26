import 'package:flutter/material.dart';

import '../Models/Agent.dart';


class AgentDetails extends StatelessWidget {
  const AgentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Agent agent = ModalRoute.of(context)!.settings.arguments as Agent;
    return Scaffold(
      appBar: AppBar(
        title: Text(agent.firstName + agent.lastName),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Card(
        child: Column(
          children: [
            Text(agent.id.toString()),
            Text(agent.firstName + agent.lastName),
            Text(agent.ssid),
            Text(agent.catalogue.toList().toString())
          ],
        ),
      ),
    );
  }
}
