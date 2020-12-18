import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/models/address_model.dart';
import 'package:couriermanagementsystem/modules/employee/home/models/employee_model.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';

enum courierStatus {
  Pending,
  Approved,
  Dispathced,
  Shipped,
  onTheWay,
  Delivered,
  Rejected,
}
enum courierType { Document, Nondocument }

class Courier {
  String cid;
  final String courierName;
  final courierType type;
  final int quantity;
  final double unitPrice;
  double deliveryCharges, totalPrice;
  final double length, breadth, height, weight;
  final Address origin, destination;
  DateTime expectedDeliveryDate;
  Employee deliveryMan;
  courierStatus status;

  Courier({
    this.cid,
    @required this.courierName,
    @required this.type,
    @required this.unitPrice,
    @required this.quantity,
    this.deliveryCharges,
    @required this.totalPrice,
    @required this.length,
    @required this.breadth,
    @required this.height,
    @required this.weight,
    @required this.origin,
    @required this.destination,
    this.expectedDeliveryDate,
    this.deliveryMan,
    this.status = courierStatus.Pending,
  });

  ///Setters for setting expected DateTime, deliveryMan, delivery Charges;
  set assignDeliveryMan(Employee _e) {
    this.deliveryMan = _e;
  }

  set deliveryTime(DateTime _time) {
    this.expectedDeliveryDate = _time;
  }

  set addDeliveryCharges(double _charge) {
    if (_charge < 0) _charge = 0;
    this.deliveryCharges = _charge;
    this.totalPrice += this.deliveryCharges;
  }

  /// Change status
  set changeStatus(courierStatus _s) {
    this.status = _s;
  }

  /// Deserailization of Courier
  factory Courier.fromJson(DocumentSnapshot _snapshot) {
    Map<String, dynamic> _parsedJson = _snapshot.data();
    Address _origin = Address.fromJson(_parsedJson["origin"]),
        _destination = Address.fromJson(_parsedJson["destination"]);
    Employee _deliveryMan = Employee.fromJson(_parsedJson['deliveryMan']);
    DateTime _expDel = DateTime(_parsedJson['expectedDeliveryDate']);
    courierStatus _status =
        EnumToString.fromString(courierStatus.values, _parsedJson['status']);
    courierType _type =
        EnumToString.fromString(courierType.values, _parsedJson['type']);
    return Courier(
      cid: _snapshot.id,
      courierName: _parsedJson['courierName'],
      type: _type, //enum type
      length: _parsedJson['length'],
      breadth: _parsedJson['breadth'],
      height: _parsedJson['height'],
      weight: _parsedJson['weight'],
      unitPrice: _parsedJson['unitPrice'],
      deliveryCharges: _parsedJson['deliveryCharges'],
      totalPrice: _parsedJson['totalPrice'],
      origin: _origin, //Address
      destination: _destination, //Address
      quantity: _parsedJson['quantity'],
      expectedDeliveryDate: _expDel, //DateTime
      deliveryMan: _deliveryMan, //Employee
      status: _status, //enum status
    );
  }

  /// Serailization of Courier
  Map<String, dynamic> toJson() {
    Map<String, dynamic> _origin = origin.toJson(),
        _destination = destination.toJson(),
        _deliveryMan = deliveryMan.toJson();
    String _expDel = expectedDeliveryDate.toString(),
        _status = EnumToString.convertToString(status, camelCase: true),
        _type = EnumToString.convertToString(type);
    return {
      "courierName": courierName,
      "type": _type, //enum type
      "length": length,
      "breadth": breadth,
      "height": height,
      "weight": weight,
      "unitPrice": unitPrice,
      "deliveryCharges": deliveryCharges,
      "totalPrice": totalPrice,
      "origin": _origin, //Address
      "destination": _destination, //Address
      "quantity": quantity,
      "expectedDeliveryDate": _expDel, //DateTime
      "deliveryMan": _deliveryMan, //Employee
      "status": _status, //enum status
    };
  }
}
