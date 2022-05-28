import 'package:agencyui/Models/Agency.dart';
import 'package:flutter/material.dart';

class AgencyDetails extends StatelessWidget {
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
      body: Card(
        child: Column(
          children: [
            Text(agency.id.toString()),

            Text(agency.name),
            Text(agency.agents.toString()),
            Text(agency.properties.toString())
          ],
        ),
      ),
    );
  }
}
