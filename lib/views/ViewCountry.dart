import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbook/components/themecolors.dart';
import 'package:travelbook/models/country.dart';
import 'package:travelbook/models/providers/traveledlist.dart';

class ViewCountry extends StatefulWidget {
  final Country country;
  ViewCountry({this.country});
  @override
  _ViewCountryState createState() => _ViewCountryState();
}

class _ViewCountryState extends State<ViewCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country Card')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(myDefaultPadding),
          child: Column(children: [
            Text(widget.country.emoji,
                style: TextStyle(fontSize: 120, color: Colors.black)),
            Row(
              children: [
                Icon(Icons.flag),
                Text(
                  'Country : ${widget.country.name}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: myPrimaryColor),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.flag),
                Text('Capital : ${widget.country.capital}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.flag_outlined),
                Text('Native: ${widget.country.ntive}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.money),
                Text('Currency: ${widget.country.currency}'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.phone),
                Text('Phone: ${widget.country.phone}'),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
