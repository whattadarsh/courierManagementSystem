import 'package:couriermanagementsystem/modules/customer/features/tracking_page/widgets/tracking_widget.dart';
import 'package:couriermanagementsystem/modules/employee/drawer/widgets/emp_drawer.dart';
import 'package:couriermanagementsystem/modules/employee/home/models/employee_model.dart';
import 'package:couriermanagementsystem/modules/employee/home/services/employee_info_services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:couriermanagementsystem/core/data/dummy_data.dart';

import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:provider/provider.dart';

class EmployeeWelcomePage extends StatefulWidget {
  static const routeName = "/EmployeeWelcomePage";

  @override
  _EmployeeWelcomePageState createState() => _EmployeeWelcomePageState();
}

class _EmployeeWelcomePageState extends State<EmployeeWelcomePage> {
  GlobalKey<ScaffoldState> scaffoldKey;
  String role;
  @override
  void initState() {
    scaffoldKey = new GlobalKey<ScaffoldState>();
    role = "";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EmployeeInfoServices>(context, listen: false)
          .registerOrFetch(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      designSize: Size(
        392.72727272727275,
        850.9090909090909,
      ),
      allowFontScaling: true,
    );
    var _greetingsToUser = Container(
      padding: EdgeInsets.all(8.w),
      child: RichText(
        text: TextSpan(
          text: "Hey employee!",
          style: TextStyle(
            fontSize: 25.sp,
            color: Colors.black,
          ),
          // children: [
          //   TextSpan(
          //     text: "user!", //TODO: Change with customer name if logged in
          //     style: TextStyle(
          //       fontSize: 25.sp,
          //       fontWeight: FontWeight.w700,
          //       color: Colors.black,
          //     ),
          //   ),
          // ],
        ),
      ),
    );
    var _body = SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff3feee6),
              Colors.teal[300],
              Colors.teal[100],
              Colors.teal[50],
            ],
            begin: Alignment.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Menu Button
              IconButton(
                padding: EdgeInsets.zero,
                enableFeedback: true,
                tooltip: "Menu",
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 30.sp,
                ),
                onPressed: () {
                  print("Opening drawer...");
                  scaffoldKey.currentState.openDrawer();
                },
              ),
              //Vertical Space
              SizedBox(
                height: 10.h,
              ),

              /// Greetings to User
              _greetingsToUser,
              //Vertical Space
              SizedBox(
                height: 10.h,
              ),

              /// Courier Tracking Widget
              TrackCourier(),

              /// Show Available Couriers
              //Vertical Space
              SizedBox(
                height: 10.h,
              ),
              //Show Employees
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     //Vertical Space
              //     SizedBox(
              //       height: 20.h,
              //     ),
              //     Container(
              //       padding: EdgeInsets.all(8.w),
              //       alignment: Alignment.centerLeft,
              //       child: Text(
              //         "Your Employees",
              //         style: TextStyle(
              //           fontSize: 20.sp,
              //           color: appThemeColor6,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //     //Vertical Space
              // //     SizedBox(
              // //       height: 10.h,
              //     ),
              //     generateEmployees(),
              //     //Vertical Space
              //     SizedBox(
              //       height: 10.h,
              //     ),
              //     Container(
              //       width: double.infinity,
              //       color: Colors.black,
              //       height: 2.h,
              //     ),
              //     //Vertical Space
              //     SizedBox(
              //       height: 10.h,
              //     ),
              //   ],
              // ),

              /// Widget to show more features of the app
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Vertical Space
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Available Couriers",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: appThemeColor6,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  //Vertical Space
                  SizedBox(
                    height: 10.h,
                  ),
                  generateCouriers(),
                  //Vertical Space
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black,
                    height: 2.h,
                  ),
                  //Vertical Space
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              //Vertical Space
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      key: scaffoldKey,
      drawer: EmpDrawerWidget(),
      // Disable opening the drawer with a swipe gesture.
      // drawerEnableOpenDragGesture: false,
      body: _body,
    );
  }

  Widget generateEmployees() {
    var couriers = dummyemployees;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: couriers.length,
      itemBuilder: (BuildContext context, int index) {
        Employee c = couriers[index];
        return Card(
          margin: EdgeInsets.all(10.w),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  c.name,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Vertical Space
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Email: ${c.email}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Couriers Assigned: ${c.assignedCouriers.length}",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    //Vertical Space
                    SizedBox(
                      height: 5.h,
                    ),
                    // Text(
                    //   "Employee Code: ${c.eid}",
                    //   style: TextStyle(
                    //     fontSize: 20.sp,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                  ],
                ),
                //Vertical Space
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget generateCouriers() {
    var couriers = dummycouriers;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: couriers.length,
      itemBuilder: (BuildContext context, int index) {
        Courier c = couriers[index];
        return Card(
          margin: EdgeInsets.all(10.w),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  c.courierName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Vertical Space
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Origin: ${c.origin.addressString()}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Vertical Space
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "\nDestination: ${c.destination.addressString()}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Amount to Collect: ${c.totalPrice.toString()}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Vertical Space
                SizedBox(
                  height: 5.h,
                ),
                //Vertical Space
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
