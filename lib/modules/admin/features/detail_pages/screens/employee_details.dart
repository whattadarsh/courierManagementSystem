import 'package:couriermanagementsystem/core/data/dummy_data.dart';
import 'package:couriermanagementsystem/modules/employee/home/models/employee_model.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeDetails extends StatefulWidget {
  static const routeName = "/EmployeeDetails";
  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  Employee emp;
  @override
  void initState() {
    emp = dummyemployees[0];
    super.initState();
  }

  final TextStyle textNormalStyle = TextStyle(
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontSize: 16.sp,
    letterSpacing: 0.7,
  );

  @override
  Widget build(BuildContext context) {
    emp = ModalRoute.of(context).settings.arguments; //CHECKIT

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
        title: Text("Employee Details".toUpperCase()),
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
                "${emp.name}" ?? "",
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

              ///Employe Details
              buildTitle(title: "Employee Code"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(title: emp.eid ?? ""),
              SizedBox(
                height: 20.h,
              ),

              ///Phone No.
              buildTitle(title: "Phone No."),
              SizedBox(
                height: 10.h,
              ),
              buildPara(
                title: emp.phoneNumber ?? "",
              ),
              SizedBox(
                height: 20.h,
              ),

              ///Email
              buildTitle(title: "Email"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(
                title: emp.email ?? "",
              ),
              SizedBox(
                height: 20.h,
              ),

              ///Assigned Couriers
              buildTitle(title: "Assigned Couriers"),
              SizedBox(
                height: 10.h,
              ),
              buildPara(
                title: emp.assignedCouriers.length.toString() ?? "",
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
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
      child: Text(title.toUpperCase() ?? "", style: defaultStyle),
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
      child: Text(title ?? "", style: defaultStyle),
    );
  }
}
