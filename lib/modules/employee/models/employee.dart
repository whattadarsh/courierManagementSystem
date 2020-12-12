import 'package:firebase/firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:couriermanagementsystem/core/models/courier_model.dart';

class Employee {
  String uid;
  String name;
  String email;
  String phoneNumber;
  List<Courier> assignedCouriers = [];

  ///Constructur
  Employee({
    this.uid,
    @required this.name,
    @required this.email,
    @required this.phoneNumber,
    this.assignedCouriers,
  });

  void setFields({String name, String email, String phoneNumber}) {
    this.name = name;
    this.email = email;
    this.phoneNumber = phoneNumber;
  }

  void addCourier(Courier _newCourier) {
    this.assignedCouriers.add(_newCourier);
  }

  //Update Courier Status
  void upateCourierSatus(int index) {
    this.assignedCouriers.removeAt(index);
  }

  factory Employee.fromJson(DocumentSnapshot _snapshot) {
    Map<String, dynamic> _parsedJson = _snapshot.data();
    var assignedCouriersFromJson = _parsedJson['assignedCouriers'] as List;
    List<Courier> assignedCouriers = assignedCouriersFromJson != null
        ? assignedCouriersFromJson
            .map((courier) => Courier.fromJson(courier))
            .toList()
        : [];
    return Employee(
      uid: _snapshot.id,
      name: _parsedJson["name"],
      email: _parsedJson["email"],
      phoneNumber: _parsedJson["phoneNumber"],
      assignedCouriers: assignedCouriers,
    );
  }

  Map<String, dynamic> toJson() {
    var assignedCouriersToJson = assignedCouriers != null
        ? assignedCouriers.map((courier) => courier.toJson()).toList()
        : [];
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "assignedCouriers": assignedCouriersToJson,
    };
  }
}
