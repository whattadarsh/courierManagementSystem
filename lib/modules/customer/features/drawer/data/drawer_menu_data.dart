import 'package:couriermanagementsystem/core/screens/aboutus.dart';
import 'package:couriermanagementsystem/modules/customer/features/address/screens/addresses.dart';
import 'package:flutter/material.dart';

List<Map<String, Object>> menuData = [
  {
    'icon': Icons.home_outlined,
    'navigateTo': '/',
    'title': 'Home',
  },
  {
    'icon': Icons.analytics_outlined,
    'navigateTo': MyAddresses.routeName,
    'title': 'Your Addresses',
  },
  {
    'icon': Icons.delivery_dining,
    'navigateTo': Aboutus.routeName, //TODO: Show orders
    'title': 'Your Shipments',
  },
  {
    'icon': Icons.info_outline,
    'navigateTo': Aboutus.routeName,
    'title': 'About Us',
  },
  {
    'icon': Icons.person_outline,
    'navigateTo': Aboutus.routeName,
    'title': 'Contact Us',
  }
];
