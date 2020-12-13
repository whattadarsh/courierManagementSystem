import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Signup extends StatefulWidget {
  static const routeName = "/Signup";
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String lottiePath, role;
  @override
  void initState() {
    lottiePath = "assets/lottieFiles/delivery_truck.json";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> args = ModalRoute.of(context).settings.arguments;
    role = args["role"];

    ///ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      //For Redmi Note 9
      width: 392.72727272727275,
      height: 850.9090909090909,
      allowFontScaling: true,
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Lottie.asset(
                    "assets/lottieFiles/delivery_truck.json",
                    repeat: true,
                    reverse: true,
                    animate: true,
                    frameRate: FrameRate(30),
                    fit: BoxFit.cover,
                  ),
                ),
                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    text: "CourierWay Registration as",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontFamily: 'Raleway',
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: "\n\t\t$role",
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),

                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  // controller: controller,
                  decoration: InputDecoration(
                    labelText: "Email*",
                    isDense: true,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  // controller: controller,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password*",
                    isDense: true,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.all(10.w),
                  width: double.infinity,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(30.w)),
                    child: Container(
                      padding: EdgeInsets.all(15.w),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    onPressed: () {
                      //TODO: Register User and redirect to Welcome Page
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //   widget.path,
                      //   (Route<dynamic> route) => false,
                      //   arguments: {
                      //     "lottie": widget.lottiePath,
                      //     "role": widget.title
                      //   },
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
