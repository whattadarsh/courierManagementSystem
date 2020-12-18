import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableEmployees extends StatefulWidget {
  static const routeName = "/AvailableEmployees";
  @override
  _AvailableEmployeesState createState() => _AvailableEmployeesState();
}

class _AvailableEmployeesState extends State<AvailableEmployees> {
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
      //For Redmi Note 7 pro
      //width: 360,
      //height: 720,
      allowFontScaling: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("AvailableEmployees"),
      ),
      body: Container(
        child: Center(
          child: Text("AvailableEmployees"),
        ),
      ),
    );
  }
}
