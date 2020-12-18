import 'package:couriermanagementsystem/modules/admin/features/detail_pages/screens/courier_details.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/screens/my_employees.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/admin/features/detail_pages/screens/employee_details.dart';
import 'modules/admin/features/home/screens/admin_welcome_page.dart';

import 'modules/admin/features/home/services/admin_info_services.dart';
import 'modules/employee/home/services/employee_info_services.dart';

/// Project Import
import 'shared/common.dart';
import 'modules/customer/features/home/cust_welcome_page.dart';
import 'shared/undefined_view.dart';
import 'core/authentication/screens/signup_page.dart';
import 'modules/customer/features/shipment/screens/create_shipment.dart';
import 'package:couriermanagementsystem/core/authentication/screens/onboarding_page.dart';
import 'package:couriermanagementsystem/core/authentication/screens/login_page.dart';
import 'package:couriermanagementsystem/core/screens/aboutus.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/services/customer_info_services.dart';
import 'package:couriermanagementsystem/shared/theme.dart';

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
          return AdminWelcomePage();
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
    return MultiProvider(
      ///Adding providers for App
      providers: [
        ChangeNotifierProvider(
          create: (context) => CustomerInfoServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmployeeInfoServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminInfoServices(),
        ),
      ],
      child: MaterialApp(
        title: companyName,
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: handleHomePage(),
        routes: {
          // "/": (ctx) => OnboardingPage(),
          Aboutus.routeName: (ctx) => Aboutus(),
          WelcomePage.routeName: (ctx) => WelcomePage(),
          OnboardingPage.routeName: (ctx) => OnboardingPage(),
          Login.routeName: (ctx) => Login(),
          Signup.routeName: (ctx) => Signup(),
          CourierDetails.routeName: (ctx) => CourierDetails(),
          EmployeeDetails.routeName: (ctx) => EmployeeDetails(),
          CreateShipment.routeName: (ctx) => CreateShipment(),
          AvailableEmployees.routeName: (ctx) => AvailableEmployees(),
          // AvailableCouriers.routeName: (ctx) => AvailableCouriers(),
          // AssignedCouriersByAdmin.routeName: (ctx) => AssignedCouriersByAdmin(),
          // AssignedCouriers.routeName: (ctx) => AssignedCouriers(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => UndefinedView(
            name: settings.name,
          ),
        ),
      ),
    );
  }
}
