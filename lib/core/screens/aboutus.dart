import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Aboutus extends StatefulWidget {
  static const routeName = "/Aboutus";
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
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
        title: Text("About us"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Created by Adarsh Srivastava (B180001CS)",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
