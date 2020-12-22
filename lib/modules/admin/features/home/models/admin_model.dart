import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

///Project Imports
import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/modules/employee/home/models/employee_model.dart';

class Admin {
  String aid;
  String name;
  String email;
  String phoneNumber;
  List<Courier> availableCouriers = [];
  List<Courier> approvedCouriers = [];
  List<Employee> employees = [];

  ///Constructur
  Admin({
    this.aid,
    @required this.name,
    @required this.email,
    @required this.phoneNumber,
    this.approvedCouriers,
    this.availableCouriers,
    this.employees = const [],
  });

  factory Admin.fromJson(DocumentSnapshot _snapshot) {
    Map<String, dynamic> _parsedJson = _snapshot.data();
    var employees = _parsedJson['employees'] as List;
    var approvedCouriers = _parsedJson['approvedCouriers'] as List;
    var availableCouriers = _parsedJson['availableCouriers'] as List;
    List<Courier> _couriers = availableCouriers != null
        ? availableCouriers.map((courier) => Courier.fromJson(courier)).toList()
        : [];

    List<Courier> _approvedCouriers = approvedCouriers != null
        ? availableCouriers.map((courier) => Courier.fromJson(courier)).toList()
        : [];
    List<Employee> _emps = employees != null
        ? availableCouriers.map((emp) => Employee.fromJson(emp)).toList()
        : [];
    return Admin(
      aid: _snapshot.id,
      name: _parsedJson["name"],
      email: _parsedJson["email"],
      phoneNumber: _parsedJson["phoneNumber"],
      availableCouriers: _couriers,
      approvedCouriers: _approvedCouriers,
      employees: _emps,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> _availableCouriersToJson =
        availableCouriers != null
            ? availableCouriers.map((courier) => courier.toJson()).toList()
            : [];

    List<Map<String, dynamic>> _approvedCouriersJson = approvedCouriers != null
        ? approvedCouriers.map((courier) => courier.toJson()).toList()
        : [];

    List<Map<String, dynamic>> _emps = employees != null
        ? availableCouriers.map((emp) => emp.toJson()).toList()
        : [];
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "availableCouriers": _availableCouriersToJson,
      "approvedCouriers": _approvedCouriersJson,
      "employees": _emps,
    };
  }
}
