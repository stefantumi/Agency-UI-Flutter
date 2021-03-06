import 'package:agencyui/Actions/AgencyAction.dart';
import 'package:agencyui/Models/Agency.dart';
import 'package:agencyui/View/AgencyDetailsView.dart';
import 'package:flutter/material.dart';

class AgencyListView extends StatefulWidget {
  const AgencyListView({Key? key}) : super(key: key);

  @override
  State<AgencyListView> createState() => _AgencyListViewState();
}

class _AgencyListViewState extends State<AgencyListView> {
  late Future<List<Agency>> futureAgencies;

  @override
  void initState() {
    super.initState();
    futureAgencies = getAgencyList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Agency>>(
      future: futureAgencies,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                Agency agency = snapshot.data[index];
                return ListTile(
                  title: Text(agency.name.toString()),
                  leading: CircleAvatar(
                    child: Text(agency.id.toString()),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AgencyDetails(
                            agencyId: agency.id,
                          );
                        }),
                    );
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
