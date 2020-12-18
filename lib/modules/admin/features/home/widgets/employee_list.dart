import 'package:couriermanagementsystem/core/data/dummy_data.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/screens/employee_details.dart';
import 'package:couriermanagementsystem/modules/employee/home/models/employee_model.dart';
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({
    Key key,
  }) : super(key: key);

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
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
    return Column(
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
            "Your Employees",
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
        ...generateEmployees(),
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
    );
  }

  List<Widget> generateEmployees() {
    var emps = dummyemployees;
    return List.generate(
      emps.length,
      (int index) {
        Employee _emp = emps[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            Navigator.of(context)
                .pushNamed(EmployeeDetails.routeName, arguments: _emp);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.sp)),
          title: Card(
            margin: EdgeInsets.all(2.w),
            child: Container(
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      child: Text(
                        _emp.name,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // Vertical Space
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      child: Text(
                        "Email: ${_emp.email}",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      child: Text(
                        "Couriers Assigned: 5",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // Vertical Space
                  SizedBox(
                    height: 5.h,
                  ),
                  // Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: FittedBox(
                  //         fit: BoxFit.fitWidth,
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           "Employee Code: ${_emp.eid}",
                  //           style: TextStyle(
                  //             fontSize: 20.sp,
                  //             fontWeight: FontWeight.w700,
                  //           ),
                  //         ))),

                  //Vertical Space
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
