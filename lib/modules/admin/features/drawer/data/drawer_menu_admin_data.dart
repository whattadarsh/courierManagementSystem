import 'package:flutter/material.dart';

///Project Imports
import 'package:couriermanagementsystem/core/screens/aboutus.dart';

import '../../detail_pages/screens/assigned_courier.dart';
import '../../detail_pages/screens/available_couriers.dart';
import '../../detail_pages/screens/available_employees.dart';

List<Map<String, Object>> menuData = [
  {
    'icon': Icons.home_outlined,
    'navigateTo': '/',
    'title': 'Home',
  },
  {
    'icon': Icons.analytics_outlined,
    'navigateTo': AvailableEmployees.routeName,
    'title': 'Your employees',
  },
  {
    'icon': Icons.delivery_dining,
    'navigateTo': AssignedCouriersByAdmin.routeName,
    'title': 'Your accepted Couriers',
  },
  {
    'icon': Icons.article_outlined,
    'navigateTo': AvailableCouriers.routeName,
    'title': 'Available Couriers',
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
