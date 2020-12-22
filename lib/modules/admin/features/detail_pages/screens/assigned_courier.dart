import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Project Imports
import '../../home/widgets/couriers_list.dart';

class AssignedCouriersByAdmin extends StatefulWidget {
  static const routeName = "/AssignedCouriersByAdmin";
  @override
  _AssignedCourierByAdminState createState() => _AssignedCourierByAdminState();
}

class _AssignedCourierByAdminState extends State<AssignedCouriersByAdmin> {
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
        title: Text("AssignedCouriersByAdmin"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Show Couriers
            CouriersList(use: "Page"), //TODO: Show assigned couriers
          ],
        ),
      ),
    );
  }
}
