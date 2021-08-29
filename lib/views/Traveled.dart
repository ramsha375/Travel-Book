import 'package:flutter/material.dart';
import 'package:travelbook/models/providers/traveledlist.dart';
import 'package:travelbook/views/AllTraveled.dart';
import 'package:travelbook/components/searchbar.dart';

class Traveled extends StatefulWidget {
  @override
  _TraveledState createState() => _TraveledState();
}

class _TraveledState extends State<Traveled> {
  TextEditingController controller = new TextEditingController();
  String filter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Traveled Countries')),
        body: Column(
          children: <Widget>[
            SearchBar(controller),
            AllTraveled(filter),
          ],
        ));
  }
}
