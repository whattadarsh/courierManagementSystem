import 'package:couriermanagementsystem/modules/customer/features/profile/models/address_model.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/models/customer_model.dart';
import 'package:flutter/material.dart';

//Project Imports
import 'fetch_customer_data.dart';

class CustomerInfoServices extends ChangeNotifier {
  Customer customerData;
  bool hasProfileData = false;
  Future<void> setUserId(
      {@required String userId,
      @required String email,
      @required BuildContext context}) async {
    this.customerData = new Customer(
      uid: userId,
      name: "John Doe",
      email: email,
      phoneNumber: "1234567890",
    );

    ///fetch user details from firebase
    this.customerData = await fetchCustomerDetails(this.customerData, context);
    notifyListeners();
  }

  void setCustomerFields(
      {String name,
      String email,
      String phoneNumber,
      String profilePictureUrl}) {
    this.customerData.setFields(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
        );
    this.hasProfileData = true;
    notifyListeners();
  }

  Future<void> addAddress(Address _newAddress) async {
    this.customerData.addAddr(_newAddress);
    await this.updateUserInfoData();
    notifyListeners();
  }

  void removeAddress(int index) {
    this.customerData.removeAddr(index);
    this.updateUserInfoData();
    notifyListeners();
  }

  // void resetUserId() {
  //   this.customerData = null;
  //   removeUserId();
  //   notifyListeners();
  // }

  Future<void> updateUserInfoData() async {
    await updateCustomer(this.customerData);
    notifyListeners();
  }
}
