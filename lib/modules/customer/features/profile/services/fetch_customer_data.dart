import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/models/customer_model.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/services/customer_info_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Method to upload the fields of cust
Future<void> createCustomer(Customer cust) async {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  await _db
      .collection("customers")
      .doc(cust.uid)
      .set(cust.toJson(), SetOptions(merge: true));
}

///Method to fetch the cust data
Future<Customer> fetchCustomerDetails(
    Customer cust, BuildContext context) async {
  Customer _cust;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  DocumentSnapshot _custDocSnapshot =
      await _db.collection("customers").doc(cust.uid).get();
  if (_custDocSnapshot.exists == false) {
    ///New cust Upload Details
    await createCustomer(cust);
    _custDocSnapshot = await _db.collection("customers").doc(cust.uid).get();
    _cust = Customer.fromJson(_custDocSnapshot);
  } else {
    _cust = Customer.fromJson(_custDocSnapshot);
  }
  if (_cust.uid != null) {
    Provider.of<CustomerInfoServices>(context, listen: false).updateCustData();
  }
  return _cust;
}

///Method to update the fields of cust
Future<void> updateCustomer(Customer cust) async {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  await _db.collection("customers").doc(cust.uid).update(cust.toJson());
}
