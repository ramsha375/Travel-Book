import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbook/components/searchbar.dart';
import 'package:travelbook/components/themecolors.dart';
import 'package:travelbook/views/AllCountries.dart';
import 'package:travelbook/views/AllTraveled.dart';
import 'package:travelbook/views/TraveledPage.dart';
import 'package:travelbook/views/Traveled.dart';
import 'package:travelbook/models/country.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = new TextEditingController();
  String filter = '';
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Select Countries'), actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: myDefaultPadding),
            icon: Icon(
              Icons.airplanemode_active,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Traveled()));
            },
          ),
        ]),
        body: Column(
          children: <Widget>[
            SearchBar(controller),
            AllCountries(
              filter: filter,
            )
          ],
        ));
  }
}
