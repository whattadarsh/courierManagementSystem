import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'employee_info_services.dart';
import '../models/employee_model.dart';

///Method to upload the fields of emp
Future<void> createEmployee(Employee emp) async {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  await _db
      .collection("employees")
      .doc(emp.eid)
      .set(emp.toJson(), SetOptions(merge: true));
}

///Method to fetch the cust data
Future<Employee> fetchEmployeeDetails(
    Employee emp, BuildContext context) async {
  Employee _emp;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  DocumentSnapshot _empDocSnapshot =
      await _db.collection("employees").doc(emp.eid).get();
  if (_empDocSnapshot.exists == false) {
    ///New emp Upload Details
    await createEmployee(emp);
    _empDocSnapshot = await _db.collection("employees").doc(emp.eid).get();
    _emp = Employee.fromJson(_empDocSnapshot);
  } else {
    _emp = Employee.fromJson(_empDocSnapshot);
  }
  if (_emp.name != null)
    Provider.of<EmployeeInfoServices>(context, listen: false).hasProfileData =
        true;
  return _emp;
}

///Method to update the fields of emp
Future<void> updateEmployee(Employee emp) async {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  await _db.collection("employees").doc(emp.eid).update(emp.toJson());
}
