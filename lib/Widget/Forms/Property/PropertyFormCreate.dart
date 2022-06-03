import 'package:agencyui/Actions/PropertyActions.dart';
import 'package:agencyui/Models/Address.dart';
import 'package:agencyui/Models/Property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void propertyDialogCreate(context){

  TextEditingController streetNameController = TextEditingController();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  TextEditingController sizeController = TextEditingController();
  TextEditingController priceController = TextEditingController();



  showDialog(
      context: context,
      builder: (context) => Dialog(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children:  [
                        const Text("Property"),
                        TextField(
                          controller: sizeController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              filled: true,
                              labelText: 'Size'
                          ),
                        ),
                        TextField(
                          controller: priceController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                              filled: true,
                              labelText: 'Price'
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(16),
                          color: Colors.grey,
                          child: Column(
                            children: [
                              const Text("Address"),
                              TextField(
                                decoration: const InputDecoration(
                                    filled: true,
                                    labelText: 'Street Name'
                                ),
                                controller: streetNameController,
                              ),
                              TextField(
                                controller: houseNoController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                    filled: true,
                                    labelText: 'House Number'
                                ),

                              ),
                              TextField(
                                controller: zipController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                    filled: true,
                                    labelText: 'Post Code'
                                ),

                              ),
                            ],
                          )
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
                                child: const Text("apply"),
                                onPressed: (){
                                  createProperty(Property(
                                      address: Address(
                                          street: streetNameController.text,
                                          houseNo: int.parse(houseNoController.text.toString()),
                                          zip: int.parse(zipController.text.toString())),
                                      size: double.parse(sizeController.text.toString()),
                                      price: double.parse(priceController.text.toString())));
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),
            ),
          )
      )
  );
}