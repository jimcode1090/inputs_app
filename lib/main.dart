import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusScope.of(context).unfocus();
        final focus = FocusScope.of(context);
        final focusedChild = focus.focusedChild;
        if (focusedChild != null && !focusedChild.hasPrimaryFocus) {
          focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: getThemeData(context),
        home: const HomePage(),
        routes: appRoutes,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = appRoutes.keys.toList();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) {
          final routeName = keys[index];
          return ListTile(
            title: Text(routeName),
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
          );
        },
        itemCount: keys.length,
      ),
    );
  }
}
