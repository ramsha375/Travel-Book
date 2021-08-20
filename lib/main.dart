import 'package:flutter/material.dart';
import 'package:travelbook/views/themecolors.dart';
import 'package:travelbook/views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Book',
      theme: ThemeData(
        //primarySwatch: Colors.deepOrangeAccent,
        primaryColor: myPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: myTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
