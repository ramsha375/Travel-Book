import 'package:flutter/material.dart';

class SingleCountry extends StatelessWidget {
  final String countryname;
  final bool value;

  const SingleCountry(this.countryname, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          leading: Checkbox(
            value: value,
            onChanged: (value) {},
          ),
          title: Text(countryname),
        ),
      ),
    );
  }
}
