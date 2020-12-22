import 'package:couriermanagementsystem/core/screens/aboutus.dart';
import 'package:flutter/material.dart';

List<Map<String, Object>> menuData = [
  {
    'icon': Icons.home_outlined,
    'navigateTo': null,
    'title': 'Home',
  },
  {
    'icon': Icons.delivery_dining,
    'navigateTo': Aboutus.routeName,
    'title': 'Your Assigned Couriers',
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
