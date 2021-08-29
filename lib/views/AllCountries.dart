import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbook/components/themecolors.dart';
import 'package:travelbook/models/client.dart';
import 'package:travelbook/models/country.dart';
import 'package:travelbook/models/providers/traveledlist.dart';
import 'package:travelbook/views/SingleCountry.dart';

class AllCountries extends StatefulWidget {
  AllCountries({this.filter, this.check});
  final String filter;
  final bool check;

  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  // List<Country> countries = [];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    print('data');
    fetchCountries();
  }

  fetchCountries() async {
    List<Country> fetchCountries = await Country.getAllCountries();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final providerCountries =
          Provider.of<TraveledCountries>(context, listen: false);

      providerCountries.allCountries = fetchCountries;
      setState(() {
        loading = true;
      });
      // print(providerCountries.allCountries);
    });
  }

  @override
  Widget build(BuildContext context) {
    final countryData = Provider.of<TraveledCountries>(context);
    final countries = countryData.allCountries;
    return (loading)
        ? Expanded(
            child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (ctx, i) {
                  return (countries[i]
                              .name
                              .toLowerCase()
                              .contains(widget.filter) ||
                          countries[i]
                              .name
                              .toUpperCase()
                              .contains(widget.filter))
                      ? SingleCountry(
                          country: countries[i],
                        )
                      : SizedBox.shrink();
                }))
        : Center(
            child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(myPrimaryColor),
              strokeWidth: 4,
            ),
          ));
  }
}
