import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbook/models/country.dart';
import 'package:travelbook/models/providers/traveledlist.dart';
import 'package:travelbook/components/themecolors.dart';
import 'package:travelbook/views/AllTraveled.dart';
import 'package:travelbook/views/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: TraveledCountries(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Travel Book',
          theme: ThemeData(
            primaryColor: myPrimaryColor,
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: myTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        ));
  }
}
