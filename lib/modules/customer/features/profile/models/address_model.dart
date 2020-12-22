import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  String id;
  final String name,
      mobile,
      country,
      houseNoAndLandmark,
      city,
      pincode,
      state,
      addressTag;

  Address({
    this.id,
    @required this.name, //1
    @required this.mobile, //2
    @required this.houseNoAndLandmark, //3
    @required this.city, //4
    @required this.state, //5
    @required this.country, //6
    @required this.pincode, //7
    @required this.addressTag, //
  });
  factory Address.fromJson(
      {@required Map<String, dynamic> parsedJson, String id = ""}) {
    return Address(
        id: id,
        name: parsedJson['name'],
        mobile: parsedJson['mobile'],
        houseNoAndLandmark: parsedJson['houseNoAndLandmark'],
        city: parsedJson['city'],
        state: parsedJson['state'],
        country: parsedJson['country'],
        pincode: parsedJson['pincode'],
        addressTag: parsedJson['addressTag']);
  }
  Map<String, dynamic> toJson() => {
        'firstname': name,
        "address": houseNoAndLandmark,
        "country": country,
        "mobile": mobile,
        'city': city,
        'pincode': pincode,
        'state': state,
        'addressTag': addressTag,
      };

  /// One Line Address
  String addressString() {
    return this.name +
        "\n" +
        "Phone No.: " +
        this.mobile +
        "\n" +
        this.houseNoAndLandmark +
        ", " +
        this.city +
        ", " +
        this.state +
        ", " +
        this.country +
        ", PIN: " +
        this.pincode;
  }

  Future<String> addAddressToDatabase() async {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    DocumentReference addr =
        await _db.collection("userAddresses").add(this.toJson());
    return addr.id;
  }
}
