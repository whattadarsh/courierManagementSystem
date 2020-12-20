import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/modules/employee/home/models/employee_model.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

//CHECKIT: Set methods
class EditCourier with ChangeNotifier {
  Courier _courier;
  DateTime _expectedDeliveryDate;
  Employee _deliveryMan;
  double _deliveryCharges = 0;
  courierStatus _status;

  void changeStatus(courierStatus _sts) {
    print("Status changed: ${EnumToString.convertToString(_sts)}");
    this._status = _sts;
    notifyListeners();
  }

  set courier(Courier courier) {
    this._courier = courier;
  }

  Courier get courier {
    return this._courier;
  }

  void setDeliveryDate(DateTime _dt) {
    print("Date changed: ${_dt.toIso8601String().split("")[0]}");
    this._expectedDeliveryDate = _dt;
    notifyListeners();
  }

  void setDeliveryMan(Employee _emp) {
    print("Delivery Man changed: ${_emp.name}");
    this._deliveryMan = _emp;
    notifyListeners();
  }

  void setDeliveryCharges(double _charges) {
    print("Delivery Charges changed: $_charges");
    this._deliveryCharges = _charges;
    notifyListeners();
  }

  void updateAndSaveChanges() {
    this._courier.changeCourierStatus(this._status);
    this._courier.addDeliveryCharges(this._deliveryCharges);
    this._courier.assignDeliveryMan(this._deliveryMan);
    this._courier.setDeliveryTime(this._expectedDeliveryDate);
    notifyListeners();
  }
}
