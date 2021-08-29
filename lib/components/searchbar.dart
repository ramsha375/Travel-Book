import 'package:flutter/material.dart';

import 'themecolors.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;

  const SearchBar(this.controller);

  @override
  _SearchBarState createState() => _SearchBarState(this.controller);
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller;

  _SearchBarState(this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(myDefaultPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(2, 4), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12),
            hintText: 'Search',
            hintStyle: TextStyle(color: myTextColor),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
