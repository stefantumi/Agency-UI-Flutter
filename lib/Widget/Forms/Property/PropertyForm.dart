import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void propertyDialog(context, dynamic property){
  TextEditingController addressTextCtrl = TextEditingController(text: property['address']['street']);
  TextEditingController sizeTextCtrl = TextEditingController(text: property['size'].toString());
  TextEditingController priceTextCtrl = TextEditingController(text: property['price'].toString());
  TextEditingController a = TextEditingController(text: property['']);

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
                        enabled: false,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: property['id'].toString()
                        ),
                      ),
                      TextField(
                        controller: addressTextCtrl,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: "${property['address']['street'].toString()} ${property['address']['houseNo'].toString()} ${property['address']['zip'].toString()}"
                        ),
                      ),
                      TextField(
                        controller: sizeTextCtrl,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: property['size'].toString()
                        ),
                      ),
                      TextField(
                        controller: priceTextCtrl,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: property['price'].toString()
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.greenAccent
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              style: const ButtonStyle(
                              ),
                              onPressed: (){},
                              child: const Text("apply"),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
            ),
          )
      )
  );
}