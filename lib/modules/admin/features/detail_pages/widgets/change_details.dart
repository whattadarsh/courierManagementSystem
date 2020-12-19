import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import 'helper_widgets.dart';

void changeCouierDetails(BuildContext context, Courier _courier) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (context) {
      return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Vertical Space
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Courier Status of id: xSaowAnsa1312AA", //CHECKIT
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              dashedDivider,

              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  child: Text(
                    "Product Name: " + _courier.courierName,
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTitle(title: "Shipment Status"),
                    SizedBox(
                      width: 10,
                    ),
                    buildPara(
                        title: EnumToString.convertToString(_courier.status) ??
                            ""),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  child: Text(
                    "current status: " +
                        courierStatus.Dispathced.toString().split('.').last,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                // width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(30)),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Ok",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("Getting back");
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
