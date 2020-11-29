import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      width: 392.72727272727275,
      height: 850.9090909090909,
      allowFontScaling: true,
    );
    return Scaffold(
      drawer: Container(),
      // Disable opening the drawer with a swipe gesture.
      drawerEnableOpenDragGesture: false,
      // appBar: AppBar(
      //   title: Text(companyName),
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Colors.white,
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Hello user",
            ), //TODO: Change `user` with the session user name
          ),
        ),
      ),
    );
  }
}
