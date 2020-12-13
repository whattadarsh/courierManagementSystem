import 'package:couriermanagementsystem/core/authentication/screens/onboarding_page.dart';
import 'package:couriermanagementsystem/core/authentication/screens/login_page.dart';
import 'package:couriermanagementsystem/core/screens/aboutus.dart';
import 'package:couriermanagementsystem/modules/customer/features/tracking_page/screens/courier_status_page.dart';
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'core/authentication/screens/signup_page.dart';
import 'modules/customer/features/shipment/screens/create_shipment.dart';

/// Project Import
import 'shared/common.dart';
import 'modules/customer/features/welcome_page.dart';
import 'shared/undefined_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.teal, // navigation bar color
      statusBarColor: Colors.teal, // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Widget handleHomePage() {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SafeArea(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          );
        }

        // Once complete, show  application
        if (snapshot.connectionState == ConnectionState.done) {
          return OnboardingPage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return SafeArea(
          child: CircularProgressIndicator(
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: companyName,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: handleHomePage(),
      routes: {
        // "/": (ctx) => OnboardingPage(),
        Aboutus.routeName: (ctx) => Aboutus(),
        WelcomePage.routeName: (ctx) => WelcomePage(),
        Login.routeName: (ctx) => Login(),
        Signup.routeName: (ctx) => Signup(),
        CourierStatus.routeName: (ctx) => CourierStatus(),
        CreateShipment.routeName: (ctx) => CreateShipment(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name,
        ),
      ),
    );
  }
}
