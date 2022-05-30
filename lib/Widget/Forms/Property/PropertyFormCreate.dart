import 'package:agencyui/Actions/PropertyActions.dart';
import 'package:agencyui/Models/Address.dart';
import 'package:agencyui/Models/Owner.dart';
import 'package:agencyui/Models/Property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void propertyDialogCreate(context){

  Property property = Property(id: 2,address: Address(id: 1, street: "street", houseNo: 32, zip: 1212) , size: 122, owner: Owner(id: 2, firstName: 'firstName', lastName: 'lastName', ssid: 'ssid', property: []), price: 0);

  TextEditingController addressTextCtrl = TextEditingController(text: property.address.street);
  TextEditingController sizeTextCtrl = TextEditingController(text: property.size.toString());
  TextEditingController priceTextCtrl = TextEditingController(text: property.price.toString());
  TextEditingController a = TextEditingController(text: property.price.toString());
  Address address = Address(id: 1, street: "hudlu", houseNo: 2, zip: 30);

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
                              labelText: property.id.toString()
                          ),
                        ),
                    /*    TextField(
                          controller: addressTextCtrl,
                          decoration: InputDecoration(
                              filled: true,
                              labelText: "${property.address.street.toString()} ${property.address.houseNo.toString()} ${property.address.zip.toString()}"
                          ),
                        ),*/
                        TextField(
                          controller: sizeTextCtrl,
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
                          controller: priceTextCtrl,
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
                              TextFormField(
                                decoration: const InputDecoration(
                                    filled: true,
                                    labelText: 'Street Name'
                                ),
                                initialValue: address.street,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    filled: true,
                                    labelText: 'House Number'
                                ),
                                initialValue: address.houseNo.toString(),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    filled: true,
                                    labelText: 'Post Code'
                                ),
                                initialValue: address.zip.toString(),
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
                                  
                                  createProperty(Property(id: null, address: address, size: double.parse(priceTextCtrl.text), price: double.parse(priceTextCtrl.text), owner: null));
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