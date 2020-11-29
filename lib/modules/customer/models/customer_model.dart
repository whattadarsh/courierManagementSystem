import 'package:firebase/firestore.dart';
import 'package:flutter/foundation.dart';
import 'address_model.dart';

class Customer {
  String uid;
  String name;
  String email;
  String phoneNumber;
  List<Address> userAddresses = [];

  ///Constructur
  Customer({
    this.uid,
    @required this.name,
    @required this.email,
    @required this.phoneNumber,
    this.userAddresses,
  });

  Map<String, dynamic> toJson() {
    var userAddressesToJson = userAddresses != null
        ? userAddresses.map((address) => address.toJson()).toList()
        : [];
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "userAddresses": userAddressesToJson,
    };
  }

  void setFields({String name, String email, String phoneNumber}) {
    this.name = name;
    this.email = email;
    this.phoneNumber = phoneNumber;
  }

  void addAddr(Address _newAddr) {
    this.userAddresses.add(_newAddr);
  }

  void removeAddr(int index) {
    this.userAddresses.removeAt(index);
  }

  factory Customer.fromJson(DocumentSnapshot _snapshot) {
    Map<String, dynamic> parsedJson = _snapshot.data();
    var userAddressesFromJson = parsedJson['userAddresses'] as List;
    List<Address> userAddresses = userAddressesFromJson != null
        ? userAddressesFromJson
            .map((address) => Address.fromJson(address))
            .toList()
        : [];
    return Customer(
      uid: _snapshot.id,
      name: parsedJson["name"],
      email: parsedJson["email"],
      phoneNumber: parsedJson["phoneNumber"],
      userAddresses: userAddresses,
    );
  }
}
