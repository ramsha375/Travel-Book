import 'package:flutter/material.dart';
import 'package:travelbook/models/country.dart';

class TraveledCountries with ChangeNotifier {
  List<Country> _countrynames = [];
  List<Country> allCountries = [];

  List<Country> get countrynames {
    return [..._countrynames];
  }

  void addItem(String id, String name, bool visited) {
    int index = _countrynames.indexWhere((element) => element.id == id);
    if (index == -1) {
      _countrynames.add(Country(id: id, name: name, visited: visited));
    }
    notifyListeners();
  }

  void removeItem(country) {
    _countrynames.removeWhere((element) => element.id == country.id);
    notifyListeners();
  }

  void changeState(String id, String name, bool visited) {
    Country country = allCountries.firstWhere((element) => element.id == id);
    country.visited = visited;
    notifyListeners();
  }
}
