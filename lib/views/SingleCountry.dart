import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbook/components/themecolors.dart';
import 'package:travelbook/models/country.dart';
import 'package:travelbook/models/providers/traveledlist.dart';
import 'package:travelbook/views/AllCountries.dart';
import 'package:travelbook/views/Traveled.dart';
import 'package:travelbook/views/ViewCountry.dart';

class SingleCountry extends StatefulWidget {
  final Country country;
  SingleCountry({this.country});

  @override
  _SingleCountryState createState() => _SingleCountryState();
}

class _SingleCountryState extends State<SingleCountry> {
  @override
  Widget build(BuildContext context) {
    final countryData = Provider.of<TraveledCountries>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewCountry(
                          country: widget.country,
                        )));
          },
          leading: Checkbox(
            activeColor: myPrimaryColor,
            value: widget.country.visited,
            onChanged: (value) {
              if (value) {
                countryData.addItem(widget.country.id, widget.country.name,
                    widget.country.visited);
              } else {
                countryData.removeItem(widget.country);
              }
              countryData.changeState(
                  widget.country.id, widget.country.name, value);

              print(widget.country.visited);
            },
          ),
          title: Text(widget.country.name),
        ),
      ),
    );
  }
}
