import 'package:flutter/material.dart';

import '../constants/countries.dart';
import '../models/country.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _textEditingController = TextEditingController();
  late final List<Country> _countries;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _countries = countries.map<Country>((e) => Country.fromJson(e)).toList();
    
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
        iconTheme: const IconThemeData(color: Colors.black),
        title: TextField(
          controller: _textEditingController,
          // enabled: false,
          onChanged: (text) {
            _query = text;
            setState(() {});
          },
          decoration: InputDecoration(
            // label: Text("Search ..."),
            hintText: 'Search ...',
            hintStyle: const TextStyle(color: Colors.black26),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () {
                _textEditingController.clear();
                _query = '';
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(Icons.clear),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
