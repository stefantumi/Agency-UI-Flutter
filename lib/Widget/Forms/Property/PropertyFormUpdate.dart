import 'package:agencyui/Actions/PropertyActions.dart';
import 'package:agencyui/Models/Address.dart';
import 'package:agencyui/Models/Property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


void propertyDialogCreate(context, id){


  TextEditingController streetController = TextEditingController(text: 'Street Name');
  TextEditingController houseNoController = TextEditingController(text: 'House Number');
  TextEditingController zipController = TextEditingController(text: 'Post Code');
  TextEditingController sizeController = TextEditingController(text: 'Property Size');
  TextEditingController priceController = TextEditingController(text: 'Property Price');
  TextEditingController a = TextEditingController(text: '');

  Address formAddress = Address(street: "hudlu", houseNo: 2, zip: 30);
  Property formProperty = Property(address: formAddress, size: 1212, price: 1212);

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
                        TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              filled: true,
                              labelText: formProperty.id.toString()
                          ),
                        ),
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
                                TextField(
                                  decoration: const InputDecoration(
                                      filled: true,
                                      labelText: 'Street Name'
                                  ),
                                  controller: streetController,
                                ),
                                TextField(
                                  decoration: const InputDecoration(
                                      filled: true,
                                      labelText: 'House Number'
                                  ),
                                  controller: houseNoController,
                                ),
                                TextField(
                                  decoration: const InputDecoration(
                                      filled: true,
                                      labelText: 'Post Code'
                                  ),
                                  controller: zipController,
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
                               /*createProperty(Property(address: Address(
                                      street: streetController.text,
                                      houseNo: int.parse(houseNoController.text.toString()),
                                      zip: int.parse(zipController.text.toString())),
                                      size: double.parse(sizeController.text.toString()),
                                      price: double.parse(priceController.text.toString())));*/
                                  updatePropertyById(id);
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