import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Project Imports
import 'login_page.dart';
import '../widgets/entry_point.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = "/OnboardingPage";
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
      allowFontScaling: true,
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20.h),
          // color: Colors.teal[50],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: EntryPoint(
                  title: "Admin",
                  lottiePath: "assets/lottieFiles/delivery_truck.json",
                  path: Login.routeName,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: EntryPoint(
                  title: "Employee",
                  lottiePath: "assets/lottieFiles/delivery_boy_on_scooter.json",
                  path: Login.routeName,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: EntryPoint(
                  title: "Customer",
                  lottiePath: "assets/lottieFiles/home-delivery.json",
                  path: Login.routeName,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "CourierWay",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontFamily: 'Raleway',
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Text(
                "Select your role to continue...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.sp,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
