import 'package:flutter/material.dart';

void agentDialog(context, dynamic agent){
  List<TextEditingController> agentValues = [

  ];
  showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Center(
          child: Form(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:  [
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          labelText: agent['id'].toString()
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          labelText: agent['firstName'].toString()
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          labelText: agent['lastName'].toString()
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          labelText: agent['ssid'].toString()
                      ),
                    ),
                  ],
                ),
              )
          ),
        )
      )
  );
}