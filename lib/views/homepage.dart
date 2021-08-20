import 'package:flutter/material.dart';
import 'package:travelbook/views/countrylist.dart';
import 'package:travelbook/views/themecolors.dart';
import 'package:travelbook/models/allcountries.dart';
import 'package:travelbook/views/searchbar.dart';
import 'package:travelbook/views/singlecountry.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = new TextEditingController();
  String filter = '';
  Countries countrylist = Countries();

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
            onPressed: () {},
          ),
        ]),
        body: Column(
          children: <Widget>[
            SearchBar(controller),
            AllCountries(countrylist.countrynames, filter),
          ],
        ));
  }
}
