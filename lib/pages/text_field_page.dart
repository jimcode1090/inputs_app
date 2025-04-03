import 'package:flutter/material.dart';

import '../constants/countries.dart';
import '../models/country.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  late final List<Country> _countries;
  String _query = '';

  @override
  void initState() {
    super.initState();
    // final countriesList = <Country>[];
    // for (final country in countries) {
    //   countriesList.add(Country.fromJson(country));
    // }

    // _countries = countriesList;
    _countries = countries.map<Country>((e) => Country.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    late final List<Country> filteredList;
    if (_query.isEmpty) {
      filteredList = _countries;
    } else {
      filteredList =
          _countries
              .where((e) => e.name.toLowerCase().contains(_query.toLowerCase()))
              .toList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: TextField(
          // enabled: false,
          onChanged: (text) {
            _query = text;
            setState(() {});
          },
          decoration: InputDecoration(
            // label: Text("Search ..."),
            hintText: 'Search ...',
            hintStyle: TextStyle(color: Colors.black26),
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.clear),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Color(0xFF00c853)),
            // ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.black54),
            // ),
            // disabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.black12),
            // ),
          ),
        ),
      ),
      body: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: filteredList.length,
        itemBuilder: (_, index) {
          final country = filteredList[index];
          return ListTile(
            title: Text(country.name),
            subtitle: Text(country.dialCode),
            leading: Text(country.code),
          );
        },
      ),
    );
  }
}
