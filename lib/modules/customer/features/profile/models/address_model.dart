import 'package:flutter/foundation.dart';

class Address {
  final String name,
      mobile,
      country,
      houseNoAndLandmark,
      city,
      pincode,
      state,
      addressTag;

  ///Enhancment: Implement these two as advanced feature along with map
  // final double longitude, latitude;
  Address({
    @required this.name, //1
    @required this.mobile, //2
    @required this.houseNoAndLandmark, //3
    @required this.city, //4
    @required this.state, //5
    @required this.country, //6
    @required this.pincode, //7
    @required this.addressTag, //8
    // @required this.longitude,//9
    // @required this.latitude,//10
  });
  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    return Address(
        name: parsedJson['name'],
        mobile: parsedJson['mobile'],
        houseNoAndLandmark: parsedJson['houseNoAndLandmark'],
        city: parsedJson['city'],
        state: parsedJson['state'],
        country: parsedJson['country'],
        pincode: parsedJson['pincode'],
        addressTag: parsedJson['addressTag']
        // longitude: parsedJson['longitude'],
        // latitude: parsedJson['latitude'],
        );
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
        // 'longitude': longitude,
        // 'latitude': latitude,
      };

  /// One Line Address
  String addressString() {
    return this.houseNoAndLandmark +
        ", " +
        this.city +
        ", " +
        this.state +
        ", " +
        this.country +
        ", PIN: " +
        this.pincode;
  }
}
