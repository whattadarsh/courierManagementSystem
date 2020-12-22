import 'package:couriermanagementsystem/modules/customer/features/profile/models/address_model.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/models/customer_model.dart';
import 'package:couriermanagementsystem/modules/employee/home/models/employee_model.dart';
import 'package:flutter/material.dart';

//Project Imports
import 'fetch_employee_data.dart';

class EmployeeInfoServices extends ChangeNotifier {
  Employee employeeData;
  bool hasProfileData = false;
  Future<void> setEmployee(
      {@required String userId,
      @required String name,
      @required String email,
      @required String phoneNo,
      @required BuildContext context}) async {
    this.employeeData = new Employee(
      eid: userId,
      name: name,
      email: email,
      phoneNumber: phoneNo,
    );
  }

  Future<void> registerOrFetch(BuildContext context) async {
    ///fetch user details from firebase
    this.employeeData = await fetchEmployeeDetails(this.employeeData, context);
    notifyListeners();
  }

  // Future<void> updateCourierStatus(Address _newAddress) async {
  //   this.customerData.addAddr(_newAddress);
  //   await this.updateUserInfoData();
  //   notifyListeners();
  // }

  // Future<void> updateUserInfoData() async {
  //   await updateCustomer(this.customerData);
  //   notifyListeners();
  // }
}
