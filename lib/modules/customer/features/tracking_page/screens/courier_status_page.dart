import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourierStatus extends StatefulWidget {
  static const routeName = "/CourierStatus";
  @override
  _CourierStatusState createState() => _CourierStatusState();
}

class _CourierStatusState extends State<CourierStatus> {
  @override
  Widget build(BuildContext context) {
    String _trackingId = ModalRoute.of(context).settings.arguments as String;

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
        title: Text("Courier Status"),
      ),
      body: Container(
        child: Center(
          child: Text("Courier Status of $_trackingId"),
        ),
      ),
    );
  }
}
