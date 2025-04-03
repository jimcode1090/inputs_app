import 'package:flutter/material.dart';

MaterialColor generateMaterialColor(Color color) {
  Map<int, Color> swatch = {};
  for (int i = 0; i < 10; i++) {
    late int key;
    if (i == 0) {
      key = 50;
    } else {
      key = i * 100;
    }
    final opacity = (0.1 * i) + 0.1;
    swatch[key] = Color.fromRGBO(color.r.toInt(), color.g.toInt(), color.b.toInt(), opacity);
  }

  return MaterialColor(color.toARGB32(), swatch);
}
