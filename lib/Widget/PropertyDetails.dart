import 'package:flutter/material.dart';

import '../Models/Property.dart';


class PropertyDetails extends StatelessWidget {
  const PropertyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Property property = ModalRoute.of(context)!.settings.arguments as Property;
    return Scaffold(
      appBar: AppBar(
        title: Text(property.address.toString()),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Card(
        child: Column(
          children: [
            Text(property.id.toString()),
            Text(property.address.toString()),
            Text(property.size.toString()),
            Text(property.price.toString()),
            Text(property.buyer.toString()),
            Text(property.owner.toString()),
          ],
        ),
      ),
    );
  }
}
