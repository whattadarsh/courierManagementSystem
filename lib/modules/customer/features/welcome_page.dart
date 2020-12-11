import 'package:couriermanagementsystem/shared/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tracking_page/widgets/more_on_courierway.dart';
import 'tracking_page/widgets/tracking_widget.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    /// ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      width: 392.72727272727275,
      height: 850.9090909090909,
      allowFontScaling: true,
    );
    var _greetingsToUser = Container(
      padding: EdgeInsets.all(8.w),
      child: RichText(
        text: TextSpan(
          text: "Hey, ",
          style: TextStyle(
            fontSize: 25.sp,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: "user!", //TODO: Change with customer name if logged in
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
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
              // Colors.teal,
              Color(0xff3feee6),
              Colors.teal[300],
              Colors.teal[100],
              Colors.teal[50],
              // Color(0xff3feee6),
              // Color(0xff55bcc9),
              // Color(0xffcafafe),
              // Colors.white,
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
              //Vertical Space
              SizedBox(
                height: 10.h,
              ),

              /// Widget to show more features of the app
              MoreOnCourierWay(),
              //Vertical Space
              SizedBox(
                height: 10.h,
              ),

              /// Signup Invitation
              FlatButton(
                padding: EdgeInsets.all(10.w),
                onPressed: () {
                  print("navigate to Signup Page");
                },
                child: Row(
                  children: [
                    Text(
                      "Sign up /Login to $companyName",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15.sp,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        child: Text("Drawer"),
      ),
      // Disable opening the drawer with a swipe gesture.
      // drawerEnableOpenDragGesture: false,
      body: _body,
    );
  }
}
