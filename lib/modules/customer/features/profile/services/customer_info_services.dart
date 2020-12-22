import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/models/address_model.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/models/customer_model.dart';
import 'package:flutter/material.dart';

//Project Imports
import 'fetch_customer_data.dart';

class CustomerInfoServices extends ChangeNotifier {
  Customer customerData;
  bool hasProfileData = false;
  Future<void> setUser(
      {@required String userId,
      @required String name,
      @required String email,
      @required String phoneNo,
      @required BuildContext context}) async {
    this.customerData = new Customer(
      uid: userId,
      name: name,
      email: email,
      phoneNumber: phoneNo,
    );
  }

  Future<void> registerOrFetch(BuildContext context) async {
    ///fetch user details from firebase
    this.customerData = await fetchCustomerDetails(this.customerData, context);
    notifyListeners();
  }

  Future<void> addAddress(Address _newAddress) async {
    this.customerData.addAddr(_newAddress);
    await this.updateUserInfoData();
    notifyListeners();
  }

  void updateCustData() {
    this.customerData.fetchAddressses();
    this.customerData.fetchCouriers();
    this.hasProfileData = true;
    notifyListeners();
  }

  void removeAddress(int index) {
    this.customerData.removeAddr(index);
    this.updateUserInfoData();
    notifyListeners();
  }

  Future<void> createCourier(Courier c) async {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    await _db.collection("couriers").add(c.toJson());
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
