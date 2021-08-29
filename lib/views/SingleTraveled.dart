import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbook/components/themecolors.dart';
import 'package:travelbook/models/country.dart';
import 'package:travelbook/models/providers/traveledlist.dart';
import 'package:travelbook/views/AllCountries.dart';
import 'package:travelbook/views/ViewCountry.dart';

class SingleTraveled extends StatefulWidget {
  final Country country;
  SingleTraveled(this.country);

  @override
  _SingleTraveledState createState() => _SingleTraveledState();
}

class _SingleTraveledState extends State<SingleTraveled> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final countryData = Provider.of<TraveledCountries>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          leading: Checkbox(
            activeColor: myPrimaryColor,
            value: !widget.country.visited,
            onChanged: (value) {
              countryData.removeItem(widget.country);

              countryData.changeState(widget.country.id, widget.country.name,
                  widget.country.visited);
              print(widget.country.name);
              print(widget.country.visited);
            },
          ),
          title: Text(widget.country.name),
        ),
      ),
    );
  }
}
