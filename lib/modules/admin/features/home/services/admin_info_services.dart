import 'package:couriermanagementsystem/modules/admin/features/home/models/admin_model.dart';
import 'package:flutter/material.dart';

//Project Imports
import 'fetch_admin_data.dart';

class AdminInfoServices extends ChangeNotifier {
  Admin adminData;
  bool hasProfileData = false;
  Future<void> setUserId(
      {@required String userId,
      @required String email,
      @required BuildContext context}) async {
    this.adminData = new Admin(
      aid: userId,
      name: "John Doe",
      email: email,
      phoneNumber: "1234567890",
    );

    ///fetch user details from firebase
    this.adminData = await fetchAdminDetails(this.adminData, context);
    notifyListeners();
  }

  // void setAdminFields(
  //     {String name,
  //     String email,
  //     String phoneNumber,
  //     String profilePictureUrl}) {
  //   this.adminData.setFields(
  //         name: name,
  //         email: email,
  //         phoneNumber: phoneNumber,
  //       );
  //   this.hasProfileData = true;
  //   notifyListeners();
  // }

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
