import 'package:couriermanagementsystem/core/data/dummy_data.dart';
import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Project Imports

class CourierDetails extends StatefulWidget {
  static const routeName = "/CourierDetails";

  @override
  _CourierDetailsState createState() => _CourierDetailsState();
}

class _CourierDetailsState extends State<CourierDetails> {
  Courier _courier;

  @override
  void initState() {
    _courier = dummycouriers[0];
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
    _courier = ModalRoute.of(context).settings.arguments; //CHECKIT

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
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///courierName
              Text(
                "${_courier.courierName}" ?? "",
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

              ///Courier Status
              buildTitle(title: "Courier Status"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(
                  title: EnumToString.convertToString(_courier.status) ?? ""),
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
              buildTitle(title: "Tracking No."),
              SizedBox(
                height: 10.h,
              ),
              buildPara(title: _courier.cid ?? ""),
              SizedBox(
                height: 20.h,
              ),

              ///Courier Type
              buildTitle(title: "Courier Type"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(
                  title: EnumToString.convertToString(_courier.type) ?? ""),
              SizedBox(
                height: 20.h,
              ),

              ///Dimensions
              buildTitle(title: "Dimensions (in cms)"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(
                  title:
                      "${_courier.length.toString()} X ${_courier.breadth.toString()} X ${_courier.height.toString()}" ??
                          ""),
              SizedBox(
                height: 20.h,
              ),

              ///Weight
              buildTitle(title: "Weight (in kgs)"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(title: "Weight: ${_courier.weight.toString()} " ?? ""),
              SizedBox(
                height: 20.h,
              ),
              dashedDivider,

              ///Expected Delivery Details
              buildTitle(title: "Expected Delivery Details"),
              SizedBox(
                height: 10.h,
              ),
              if ((_courier.deliveryMan != null) &&
                  (_courier.expectedDeliveryDate != null))
                ...showDeliveryDetails()
              else
                buildPara(title: "Not Dispatched Yet"),
              SizedBox(
                height: 20.h,
              ),
              dashedDivider,

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
              ...showBill(),

              ///Addresses
              ///Sender
              buildTitle(title: "Sender's Details"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(title: _courier.origin.addressString() ?? ""),
              SizedBox(
                height: 20.h,
              ),

              ///Destination
              buildTitle(title: "Destination Address"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(title: _courier.destination.addressString() ?? ""),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> showDeliveryDetails() {
    return [
      buildPara(
          title: _courier.expectedDeliveryDate != null
              ? "Date: ${_courier.expectedDeliveryDate.toString()} "
              : ""),
      SizedBox(
        height: 10.h,
      ),
      buildPara(
          title: _courier.deliveryMan != null
              ? "Assigned Employee Details: ${_courier.deliveryMan.name.toString()} \nContact No.: ${_courier.deliveryMan.phoneNumber.toString()}"
              : ""),
    ];
  }

  List<Widget> showBill() {
    return [
      ///Unit Price
      buildTitle(title: "Unit Price"),
      SizedBox(
        height: 10.h,
      ),
      buildPara(title: _courier.unitPrice.toString() ?? ""),
      SizedBox(
        height: 20.h,
      ),

      ///Quantity
      buildTitle(title: "Quantity"),
      SizedBox(
        height: 10.h,
      ),
      buildPara(title: _courier.quantity.toString() ?? ""),
      SizedBox(
        height: 20.h,
      ),

      ///Delivery Charges
      buildTitle(title: "Delivery Charges"),
      SizedBox(
        height: 10.h,
      ),
      buildPara(
          title: _courier.deliveryCharges == null
              ? _courier.deliveryCharges.toString()
              : "0.0"),
      SizedBox(
        height: 20.h,
      ),

      ///Total Price
      buildTitle(title: "Total Price"),
      SizedBox(
        height: 10.h,
      ),
      buildPara(
          title: _courier.totalPrice == null
              ? _courier.totalPrice.toString()
              : "0.0"),
      SizedBox(
        height: 20.h,
      ),
    ];
  }

  Widget buildTitle({String title = ""}) {
    ///style modified
    var defaultStyle = TextStyle(
      height: 1.5,
      fontSize: 14.sp,
      color: Colors.grey,
      letterSpacing: 0.7,
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
      fontSize: 16.sp,
      color: Colors.black,
      letterSpacing: 0.7,
      fontWeight: FontWeight.normal,
    );
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: defaultStyle),
    );
  }
}
