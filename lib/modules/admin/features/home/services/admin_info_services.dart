import 'package:couriermanagementsystem/modules/admin/features/home/models/admin_model.dart';
import 'package:flutter/material.dart';

//Project Imports
import 'fetch_admin_data.dart';

class AdminInfoServices extends ChangeNotifier {
  Admin adminData;
  bool hasProfileData = false;
  Future<void> setAdmin(
      {@required String userId,
      @required String name,
      @required String email,
      @required String phoneNo,
      @required BuildContext context}) async {
    this.adminData = new Admin(
      aid: userId,
      name: name,
      email: email,
      phoneNumber: phoneNo,
    );
  }

  Future<void> registerOrFetch(BuildContext context) async {
    ///fetch user details from firebase
    this.adminData = await fetchAdminDetails(this.adminData, context);
    notifyListeners();
  }

  // Future<void> updateCourierStatus(int index) async {
  //   this.adminData.availableCouriers(_newAddress);
  //   await this.updateUserInfoData();
  //   notifyListeners();
  // }

  // void removeAddress(int index) {
  //   this.adminData.removeAddr(index);
  //   this.updateUserInfoData();
  //   notifyListeners();
  // }

  Future<void> updateUserInfoData() async {
    await updateAdmin(this.adminData);
    notifyListeners();
  }
}
