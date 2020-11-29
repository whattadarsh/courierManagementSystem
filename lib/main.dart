import 'package:flutter/material.dart';

/// Project Import
import 'shared/common.dart';
import 'modules/customer/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: companyName,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      // home: WelcomePage(),

      debugShowCheckedModeBanner: false,
      routes: {
        "/": (ctx) => WelcomePage(),
      },
    );
  }
}
