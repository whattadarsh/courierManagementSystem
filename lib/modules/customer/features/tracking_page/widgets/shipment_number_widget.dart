import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/screens/courier_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:couriermanagementsystem/core/data/dummy_data.dart';

import 'package:couriermanagementsystem/core/models/courier_model.dart';

class ShipmentNumberWidget extends StatefulWidget {
  @override
  _ShipmentNumberWidgetState createState() => _ShipmentNumberWidgetState();
}

class _ShipmentNumberWidgetState extends State<ShipmentNumberWidget> {
  GlobalKey<FormState> _formKey;
  TextEditingController shipmentNoController;

  @override
  void initState() {
    super.initState();
    _formKey = new GlobalKey<FormState>();
    shipmentNoController = TextEditingController();
  }

  @override
  void dispose() {
    shipmentNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      designSize: Size(
        392.72727272727275,
        850.9090909090909,
      ),
      allowFontScaling: true,
    );

    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Track Courier",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    // fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please enter your the tracking number of the courier.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: shipmentNoController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                labelText: "Tracking Id",
                border: OutlineInputBorder(),
                hintText: "e.g. xSaowAnsa1312AA",
              ),
              validator: (value) {
                if (shipmentNoController.text.length > 5) {
                  return null;
                }
                return "Enter valid id";
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onPressed: () async {
                // Courier c = dummycouriers[0];
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print("Requesting server for the courier status details..." +
                      shipmentNoController.text.toString());
                  showStatus(context, shipmentNoController.text);
                  await fetchCourierDetails(shipmentNoController.text, context);

                  // Navigator.of(context).pushNamed(
                  //   CourierStatus.routeName,
                  //   arguments: shipmentNoController.text.toString(),
                  // );
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchCourierDetails(String id, BuildContext context) async {
    Courier _cour;
    FirebaseFirestore _db = FirebaseFirestore.instance;
    DocumentSnapshot _courDocSnapshot =
        await _db.collection("couriers").doc(id).get();
    if (_courDocSnapshot.exists == false) {
      ///No courier exists
      Navigator.of(context).pop();
      shipmentNoController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No such shipment exists with given id."),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      _cour = Courier.fromJson(_courDocSnapshot);
      Navigator.of(context)
          .popAndPushNamed(CourierDetails.routeName, arguments: "Customer");
    }
    return _cour;
  }

  void showStatus(BuildContext context, String id) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.h),
          topRight: Radius.circular(15.h),
        ),
      ),
      isDismissible: false,
      builder: (context) {
        return SingleChildScrollView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: Container(
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please wait checking status of id: ${shipmentNoController.text}", //CHECKIT
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                // Container(
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       Align(
                //           alignment: Alignment.center,
                //           child: FittedBox(
                //             fit: BoxFit.fitWidth,
                //             alignment: Alignment.center,
                //             child: Text(
                //               "Product Name: " + c.courierName,
                //               style: TextStyle(
                //                 fontSize: 20.sp,
                //                 fontStyle: FontStyle.italic,
                //                 fontWeight: FontWeight.w700,
                //               ),
                //             ),
                //           )),
                //       //Vertical Space
                //       SizedBox(
                //         height: 5.h,
                //       ),
                //       Align(
                //           alignment: Alignment.centerLeft,
                //           child: FittedBox(
                //               fit: BoxFit.fitWidth,
                //               alignment: Alignment.centerLeft,
                //               child: Text(
                //                 "Origin: ${c.origin.pincode}",
                //                 style: TextStyle(
                //                   fontSize: 20.sp,
                //                 ),
                //               ))),
                //       //Vertical Space
                //       SizedBox(
                //         height: 5.h,
                //       ),
                //       Align(
                //           alignment: Alignment.centerRight,
                //           child: FittedBox(
                //             fit: BoxFit.fitWidth,
                //             alignment: Alignment.centerLeft,
                //             child: Text(
                //               "Destination: ${c.destination.pincode}",
                //               style: TextStyle(
                //                 fontSize: 20.sp,
                //               ),
                //             ),
                //           )),
                //       //Vertical Space
                //       SizedBox(
                //         height: 10.h,
                //       ),
                //     ],
                //   ),
                // ),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: FittedBox(
                //       fit: BoxFit.fitWidth,
                //       alignment: Alignment.center,
                //       child: Text(
                //         "current status: " +
                //             c.status.toString().split('.').last,
                //         style: TextStyle(
                //           fontSize: 20.sp,
                //           color: Colors.redAccent,
                //           fontStyle: FontStyle.italic,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     )),
                //   Container(
                //     margin: EdgeInsets.all(10.w),
                //     // width: double.infinity,
                //     child: RaisedButton(
                //       color: Theme.of(context).primaryColor,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadiusDirectional.circular(30.w)),
                //       child: Container(
                //         padding: EdgeInsets.all(15.w),
                //         child: Text(
                //           "Ok",
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 20.sp,
                //           ),
                //         ),
                //       ),
                //       onPressed: () {
                //         print("Getting back");
                //         Navigator.of(context).pop();
                //       },
                //     ),
                //   ),
              ],
            ),
          ),
        );
      },
    );
  }
}
