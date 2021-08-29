import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbook/models/country.dart';
import 'package:travelbook/models/providers/traveledlist.dart';
import 'package:travelbook/views/SingleTraveled.dart';

class AllTraveled extends StatefulWidget {
  final String filter;

  const AllTraveled(this.filter);

  @override
  _AllTraveledState createState() => _AllTraveledState();
}

class _AllTraveledState extends State<AllTraveled> {
  @override
  Widget build(BuildContext context) {
    final countryData = Provider.of<TraveledCountries>(context);
    final countries = countryData.countrynames;
    return Expanded(
        child: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (ctx, i) {
              return (countries[i].name.toLowerCase().contains(widget.filter) ||
                      countries[i].name.toUpperCase().contains(widget.filter))
                  ? SingleTraveled(countries[i])
                  : SizedBox.shrink();
            }));
  }
}
