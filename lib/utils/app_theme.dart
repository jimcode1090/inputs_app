import 'package:flutter/material.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    // useMaterial3: false,
    // primarySwatch: generateMaterialColor(Color(0xFF00c853)),
    colorScheme: ColorScheme.light(
      primary: Colors.black
    ),

    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: Color(0xFF00c853)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Color(0xFF00c853)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.black12,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: const Color.fromARGB(255, 110, 16, 16), width: 2),
      ),
    ),
  );
}
