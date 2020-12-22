import 'package:flutter/material.dart';

///Project Imports
import '../../shipment/screens/create_shipment.dart';
import 'package:couriermanagementsystem/core/screens/aboutus.dart';

List<Map<String, Object>> moreOnCourierWay = [
  {
    'icon': Icons.add_shopping_cart,
    'navigateTo': CreateShipment.routeName,
    'description': 'Add a Courier',
  },
  {
    'icon': Icons.admin_panel_settings_outlined,
    'navigateTo': Aboutus.routeName,
    'description': 'Grow your business with us',
  },
  {
    'icon': Icons.info_outline,
    'navigateTo': Aboutus.routeName,
    'description': 'About Us',
  }
];
