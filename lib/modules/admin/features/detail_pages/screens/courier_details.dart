import 'package:couriermanagementsystem/modules/admin/features/detail_pages/services/courier_editing_services.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/widgets/change_details.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/widgets/helper_widgets.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///Project Imports

class CourierDetails extends StatefulWidget {
  static const routeName = "/CourierDetails";

  const CourierDetails({Key key}) : super(key: key);

  @override
  _CourierDetailsState createState() => _CourierDetailsState();
}

class _CourierDetailsState extends State<CourierDetails> {
  @override
  void initState() {
    // _courier = dummycouriers[0];
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   Provider.of<EditCourier>(context, listen: false).courier = widget.courier;
    // });
    super.initState();
  }

  final TextStyle textNormalStyle = TextStyle(
    fontFamily: "Futura",
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontSize: 16.sp,
    letterSpacing: 0.7,
  );

  @override
  Widget build(BuildContext context) {
    ///ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      //For Redmi Note 9
      designSize: Size(
        392.72727272727275,
        850.9090909090909,
      ),
      allowFontScaling: true,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("Shipment Details".toUpperCase()),
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.h),
        child: Container(
          child: Consumer<EditCourier>(
            builder: (context, courierEditedDetails, _) {
              var c = courierEditedDetails.courier;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///courierName
                  Text(
                    "${courierEditedDetails.courier.courierName}" ?? "",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  dashedDivider,
                  SizedBox(
                    height: 20.h,
                  ),

                  /// Courier Details
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Courier Details",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Tracking No.

                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildTitle(title: "Tracking No."),
                          SizedBox(
                            width: 10.h,
                          ),
                          buildPara(
                              title: courierEditedDetails.courier.cid ?? ""),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  ///Courier Status

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTitle(title: "Shipment Status"),
                        SizedBox(
                          width: 10.h,
                        ),
                        buildPara(
                            title: EnumToString.convertToString(
                                    courierEditedDetails.courier.status) ??
                                ""),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Courier Type

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTitle(title: "Courier Type"),
                        SizedBox(
                          width: 10.h,
                        ),
                        buildPara(
                            title: EnumToString.convertToString(
                                    courierEditedDetails.courier.type) ??
                                ""),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Dimensions

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTitle(title: "Dimensions (in cms)"),
                        SizedBox(
                          width: 10.h,
                        ),
                        buildPara(
                            title:
                                "${courierEditedDetails.courier.length.toString()} x ${courierEditedDetails.courier.breadth.toString()} x ${courierEditedDetails.courier.height.toString()}" ??
                                    ""),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Weight
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTitle(title: "Weight (in kgs)"),
                        SizedBox(
                          width: 10.h,
                        ),
                        buildPara(
                            title:
                                "${courierEditedDetails.courier.weight.toString()}" ??
                                    ""),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Expected Delivery Details
                  buildTitle(title: "Expected Delivery Details"),
                  SizedBox(
                    height: 10.h,
                  ),
                  if ((courierEditedDetails.courier.deliveryMan != null) &&
                      (courierEditedDetails.courier.expectedDeliveryDate !=
                          null))
                    ...showDeliveryDetails(courierEditedDetails.courier)
                  else
                    Row(
                      children: [
                        buildPara(title: "Not Dispatched Yet"),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20.h,
                  ),
                  dashedDivider,
                  SizedBox(
                    height: 20.h,
                  ),

                  /// Billing Details

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Billing Details",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ...showBill(courierEditedDetails.courier),

                  ///Addresses
                  ///Sender
                  buildTitle(title: "Sender's Details"),
                  SizedBox(
                    height: 10.h,
                  ),
                  buildPara(
                      title:
                          courierEditedDetails.courier.origin.addressString() ??
                              ""),
                  SizedBox(
                    height: 20.h,
                  ),

                  ///Destination
                  buildTitle(title: "Destination Address"),
                  SizedBox(
                    height: 10.h,
                  ),
                  buildPara(
                      title: courierEditedDetails.courier.destination
                              .addressString() ??
                          ""),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO:Change details
          changeCouierDetails(context);
        },
        child: Icon(
          Icons.edit,
          size: 35.sp,
        ),
      ),
    );
  }
}
