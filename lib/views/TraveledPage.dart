import 'package:flutter/material.dart';
import 'package:travelbook/models/country.dart';
import 'package:travelbook/models/providers/traveledlist.dart';
import 'package:travelbook/views/AllCountries.dart';
import 'package:travelbook/views/AllTraveled.dart';
import 'package:travelbook/components/searchbar.dart';

class AllTraveledCountries extends StatefulWidget {
  const AllTraveledCountries(this.filter);
  final String filter;
  @override
  _AllTraveledCountriesState createState() => _AllTraveledCountriesState();
}

class _AllTraveledCountriesState extends State<AllTraveledCountries> {
  TextEditingController controller = new TextEditingController();
  String filter = '';
  TraveledCountries countrylist = TraveledCountries();

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
        appBar: AppBar(title: Text('Traveled Countries')),
        body: Column(
          children: <Widget>[
            SearchBar(controller),
            AllCountries(
              filter: filter,
              check: true,
            ),
          ],
        ));
  }
}
