import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Project Imports
import 'admin_info_services.dart';
import '../models/admin_model.dart';

///Method to upload the fields of admin
Future<void> createAdmin(Admin admin) async {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  await _db
      .collection("admins")
      .doc(admin.aid)
      .set(admin.toJson(), SetOptions(merge: true));
}

///Method to fetch the admin data
Future<Admin> fetchAdminDetails(Admin admin, BuildContext context) async {
  Admin _admin;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  DocumentSnapshot _adminDocSnapshot =
      await _db.collection("admins").doc(admin.aid).get();
  if (_adminDocSnapshot.exists == false) {
    ///New admin Upload Details
    await createAdmin(admin);
    _adminDocSnapshot = await _db.collection("admins").doc(admin.aid).get();
    _admin = Admin.fromJson(_adminDocSnapshot);
  } else {
    _admin = Admin.fromJson(_adminDocSnapshot);
  }
  if (_admin.name != null)
    Provider.of<AdminInfoServices>(context, listen: false).hasProfileData =
        true;
  return _admin;
}

///Method to update the fields of admin
Future<void> updateAdmin(Admin admin) async {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  await _db.collection("admins").doc(admin.aid).update(admin.toJson());
}
