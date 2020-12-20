import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/services/assign_delivery_man.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/services/change_courier_status.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/services/courier_editing_services.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/services/set_delivery_charges.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/services/set_delivery_date.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void changeCouierDetails(BuildContext context) {
  Courier _courier = Provider.of<EditCourier>(context, listen: false).courier;
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
          height: MediaQuery.of(context).size.height * 0.75,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              ChangeCourierStatus(
                courier: _courier,
              ),
              SizedBox(
                height: 20,
              ),
              AssignEmployee(
                courier: _courier,
              ),
              SizedBox(
                height: 20,
              ),
              SetDeliveryDate(
                courier: _courier,
              ),
              SizedBox(
                height: 20,
              ),
              SetDeliveryCharges(),
              SizedBox(
                height: 20,
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
                      "Update & Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("Getting back");
                    Provider.of<EditCourier>(context, listen: false)
                        .updateAndSaveChanges();
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
