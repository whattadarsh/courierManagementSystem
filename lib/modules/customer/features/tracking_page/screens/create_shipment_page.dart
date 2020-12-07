import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateShipment extends StatefulWidget {
  static const routeName = "/CreateShipment";
  @override
  _CreateShipmentState createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<CreateShipment> {
  @override
  Widget build(BuildContext context) {
    ///ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      //For Redmi Note 9
      width: 392.72727272727275,
      height: 850.9090909090909,
      //For Redmi Note 7 pro
      //width: 360,
      //height: 720,
      allowFontScaling: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("CreateShipment"),
      ),
      body: Container(
        child: Center(
          child: Text("CreateShipment"),
        ),
      ),
    );
  }
}
