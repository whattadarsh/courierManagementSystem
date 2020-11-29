import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackCourier extends StatefulWidget {
  static const routeName = "/TrackCourier";
  @override
  _TrackCourierState createState() => _TrackCourierState();
}

class _TrackCourierState extends State<TrackCourier> {
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
        title: Text("TrackCourier"),
      ),
      body: Container(
        child: Center(
          child: Text("TrackCourier"),
        ),
      ),
    );
  }
}
