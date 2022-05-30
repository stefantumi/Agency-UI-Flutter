import 'package:flutter/material.dart';

import '../../Models/Agency.dart';

class AgencyForm extends StatelessWidget {
  const AgencyForm({Key? key, required this.agency}) : super(key: key);

  final Agency agency;

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          TextFormField(
            restorationId: 'Name',
            controller: name,
            initialValue: agency.name.toString(),

          )

        ],
      ),
    );
  }
}
