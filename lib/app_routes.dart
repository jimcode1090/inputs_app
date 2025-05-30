import 'package:flutter/material.dart';

import 'pages/keyboard_types_page.dart';
import 'pages/text_field_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes{
  return {
    Routes.textField: (_) => const TextFieldPage(),
    Routes.keyboardTypes: (_) => const KeyboardTypesPage(),
  };
}