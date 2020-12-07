import 'package:couriermanagementsystem/modules/customer/features/tracking_page/screens/courier_status_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    _formKey = GlobalKey<FormState>();
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
      width: 360,
      height: 720,
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
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                height: 10.h,
              ),
            ),
            TextFormField(
              controller: shipmentNoController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                labelText: "Tracking Id",
                border: OutlineInputBorder(),
                hintText: "xSaowAnsa1312AA",
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                height: 10.h,
              ),
            ),
            ElevatedButton(
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print("Requesting server for the courier status details..." +
                      shipmentNoController.text.toString());
                  Navigator.of(context).pushNamed(
                    CourierStatus.routeName,
                    arguments: shipmentNoController.text.toString(),
                  );
                }
                shipmentNoController.clear();
              },
            ),
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                height: 10.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
