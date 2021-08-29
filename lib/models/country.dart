import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbook/models/client.dart';
import 'package:travelbook/views/AllCountries.dart';

class Country with ChangeNotifier {
  final String id;
  final String name;
  final String capital;
  final String ntive;
  final String currency;
  final String phone;
  final String emoji;
  bool visited = false;

  Country(
      {this.id,
      this.name,
      this.capital,
      this.ntive,
      this.currency,
      this.phone,
      this.emoji,
      this.visited});

  static Future<List<Country>> getAllCountries() async {
    GqlClient client = new GqlClient();
    var result = await client.query(query: CountryQuery);
    List data = result['countries'];
    List<Country> _countries = data
        .map<Country>((country) => Country(
            id: country["code"],
            name: country["name"],
            capital: country["capital"],
            ntive: country["native"],
            currency: country["currency"],
            phone: country["phone"],
            emoji: country["emoji"],
            visited: false))
        .toList();
    return _countries;
  }

  visitedCountry(bool visited) {
    visited = true;
  }
}

const String CountryQuery = r'''
{
  countries {
    name
    code
    native
    phone
    capital
    currency
    emoji
  }
}
''';

const String CountryDetails = r'''
{
  country(code: "AE"){
   
      name
      code
      native
      phone
      capital
      currency
      languages {
        name
      }
      emoji
    
  }
}
''';
