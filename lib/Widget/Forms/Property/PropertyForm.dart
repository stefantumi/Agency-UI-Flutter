import 'package:agencyui/Actions/PropertyActions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void propertyDialog(context, dynamic property){
  TextEditingController streetTextCtrl = TextEditingController();
  TextEditingController houseNoTextCtrl = TextEditingController();
  TextEditingController zipTextCtrl = TextEditingController();

  TextEditingController sizeTextCtrl = TextEditingController();
  TextEditingController priceTextCtrl = TextEditingController();

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
                        controller: streetTextCtrl,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: property['address']['street'].toString()
                        ),
                      ),
                      TextField(
                        controller: houseNoTextCtrl,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: property['address']['houseNo'].toString()
                        ),
                      ),
                      TextField(
                        controller: zipTextCtrl,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: property['address']['zip'].toString()
                        ),
                      ),
                      TextField(
                        controller: sizeTextCtrl,
                        /*inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],*/
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: property['size'].toString()
                        ),
                      ),
                      TextField(
                        controller: priceTextCtrl,
                        /*inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],*/
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
                              onPressed: (){
                                print("$property");
                                print("prufa ${<String,dynamic> {
                                  "address":<String,dynamic>{
                                    "street":streetTextCtrl.value.text.toString(),
                                    "houseNo": houseNoTextCtrl.text.toString(),
                                    "zip": zipTextCtrl.text.toString()
                                  },
                                  "size": sizeTextCtrl.text.toString(),
                                  "price": priceTextCtrl.text.toString()
                                }}");
                                updatePropertyById(
                                    <String,dynamic> {
                                      "id":property['id'],
                                      "address":<String,dynamic>{
                                        "street":streetTextCtrl.value.text.toString(),
                                        "houseNo": houseNoTextCtrl.text.toString(),
                                        "zip": zipTextCtrl.text.toString()
                                      },
                                      "size": sizeTextCtrl.text.toString(),
                                      "price": priceTextCtrl.text.toString()
                                    }
                                );
                                Navigator.of(context).pop();
                              },
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
