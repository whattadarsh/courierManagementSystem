import 'package:couriermanagementsystem/core/screens/aboutus.dart';
import 'package:couriermanagementsystem/modules/customer/features/tracking_page/screens/courier_status_page.dart';
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:flutter/material.dart';

import 'modules/customer/features/shipment/screens/create_shipment.dart';

/// Project Import
import 'shared/common.dart';
import 'modules/customer/features/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// ScreenUtil for Responsive UI

    return MaterialApp(
      title: companyName,
      theme: appTheme,
      // home: WelcomePage(),

      debugShowCheckedModeBanner: false,
      routes: {
        "/": (ctx) => WelcomePage(),
        Aboutus.routeName: (ctx) => Aboutus(),
        CreateShipment.routeName: (ctx) => CreateShipment(),
        CourierStatus.routeName: (ctx) => CourierStatus(),
      },
    );
  }
}
