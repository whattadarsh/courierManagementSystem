import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:flutter/material.dart';

List<Widget> showDeliveryDetails(Courier _courier) {
  return [
    buildPara(
        title: _courier.expectedDeliveryDate != null
            ? "Date: ${_courier.expectedDeliveryDate.toString()} "
            : ""),
    SizedBox(
      height: 10,
    ),
    buildPara(
        title: _courier.deliveryMan != null
            ? "Assigned Employee Details: ${_courier.deliveryMan.name.toString()} \nContact No.: ${_courier.deliveryMan.phoneNumber.toString()}"
            : ""),
  ];
}

List<Widget> showBill(Courier _courier) {
  return [
    ///Unit Price

    Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(title: "Unit Price"),
          SizedBox(
            width: 10,
          ),
          buildPara(title: _courier.unitPrice.toString() ?? ""),
        ],
      ),
    ),
    SizedBox(
      height: 20,
    ),

    ///Quantity

    Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(title: "Quantity"),
          SizedBox(
            width: 10,
          ),
          buildPara(title: _courier.quantity.toString() ?? ""),
        ],
      ),
    ),
    SizedBox(
      height: 20,
    ),

    ///Delivery Charges

    Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(title: "Delivery Charges"),
          SizedBox(
            width: 10,
          ),
          buildPara(
              title: _courier.deliveryCharges != null
                  ? _courier.deliveryCharges.toString()
                  : "0.0"),
        ],
      ),
    ),
    SizedBox(
      height: 20,
    ),

    ///Total Price

    Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(title: "Total Price"),
          SizedBox(
            width: 10,
          ),
          buildPara(
              title: _courier.totalPrice != null
                  ? _courier.totalPrice.toString()
                  : "0.0"),
        ],
      ),
    ),
    SizedBox(
      height: 20,
    ),
  ];
}

Widget buildTitle({String title = ""}) {
  ///style modified
  var defaultStyle = TextStyle(
    height: 1.5,
    fontSize: 15,
    color: Colors.grey,
    letterSpacing: 0.7,
    fontFamily: 'Roboto Slab',
    fontWeight: FontWeight.w700,
  );
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(title, style: defaultStyle),
  );
}

Widget buildPara({String title = ""}) {
  ///style modified
  var defaultStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontFamily: 'Roboto Slab',
    letterSpacing: 0.7,
    fontWeight: FontWeight.normal,
  );
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(title, style: defaultStyle),
  );
}
