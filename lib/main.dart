import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

/// Project Imports
import 'shared/theme.dart';
import 'shared/common.dart';
import 'core/screens/aboutus.dart';
import 'shared/undefined_view.dart';
import 'core/authentication/screens/login_page.dart';
import 'core/authentication/screens/signup_page.dart';
import 'core/authentication/screens/onboarding_page.dart';
import 'shared/loading_screens/animated_joining_screen.dart';
import 'modules/customer/features/home/cust_welcome_page.dart';
import 'modules/employee/home/screens/employee_welcome_page.dart';
import 'modules/employee/home/services/employee_info_services.dart';
import 'modules/admin/features/home/screens/admin_welcome_page.dart';
import 'modules/admin/features/home/services/admin_info_services.dart';
import 'modules/customer/features/shipment/screens/create_shipment.dart';
import 'modules/admin/features/detail_pages/screens/courier_details.dart';
import 'modules/admin/features/detail_pages/screens/assigned_courier.dart';
import 'modules/admin/features/detail_pages/screens/employee_details.dart';
import 'modules/admin/features/detail_pages/screens/available_couriers.dart';
import 'modules/admin/features/detail_pages/screens/available_employees.dart';
import 'modules/customer/features/profile/services/customer_info_services.dart';
import 'modules/admin/features/detail_pages/services/courier_editing_services.dart';

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
        return Scaffold(
          body: SafeArea(child: AnimatedJoiningScreen()),
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
        ChangeNotifierProvider<EditCourier>(
          create: (context) => EditCourier(),
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
          AvailableCouriers.routeName: (ctx) => AvailableCouriers(),
          EmployeeWelcomePage.routeName: (ctx) => EmployeeWelcomePage(),
          AdminWelcomePage.routeName: (ctx) => AdminWelcomePage(),
          AssignedCouriersByAdmin.routeName: (ctx) => AssignedCouriersByAdmin(),
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
