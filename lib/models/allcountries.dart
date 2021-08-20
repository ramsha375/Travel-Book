import 'package:flutter/material.dart';
import 'package:travelbook/views/singlecountry.dart';

class AllCountries extends StatelessWidget {
  final List<String> list;
  final String filter;

  const AllCountries(this.list, this.filter);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx, i) {
              return list[i].contains(filter)
                  ? SingleCountry(list[i], false)
                  : SizedBox.shrink();
            }));
  }
}
