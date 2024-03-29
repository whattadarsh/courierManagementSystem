import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Project Imports
import '../services/auth.dart';

class Signup extends StatefulWidget {
  static const routeName = "/Signup";
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String role;
  TextEditingController _name, _phoneNo, _email, _pswd;
  GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _name = new TextEditingController();
    _phoneNo = new TextEditingController();
    _email = new TextEditingController();
    _pswd = new TextEditingController();
    _formKey = new GlobalKey<FormState>();
    role = "";
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
      designSize: Size(
        392.72727272727275,
        850.9090909090909,
      ),
      allowFontScaling: true,
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            child: Form(
              key: _formKey,
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
                  Text(
                    "CourierWay Registration as",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontFamily: 'Raleway',
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "$role",
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontFamily: 'Raleway',
                        color: Colors.teal,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  //Vertical Space
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _name,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: "Name*",
                      isDense: true,
                      hintText: "e.g. John Doe",
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    validator: (value) {
                      if (_name.text.length >= 3) {
                        return null;
                      }
                      return "Enter name atleast with 3 characters";
                    },
                  ),
                  //Vertical Space
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "e.g. johndoe@courierway.com",
                      labelText: "Email*",
                      isDense: true,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    validator: (value) {
                      if (_email.text.contains('@') &&
                          _email.text.contains('.')) {
                        return null;
                      }
                      return "Enter Valid Email";
                    },
                  ),

                  //Vertical Space
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _phoneNo,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Phone Number*",
                      isDense: true,
                      hintText: "+91 XXXXX XXXXX",
                    ),
                    maxLength: 10,
                    cursorColor: Theme.of(context).primaryColor,
                    validator: (value) {
                      if (_phoneNo.text.length == 10) {
                        return null;
                      }
                      return "Enter Valid PhoneNumber";
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _pswd,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password*",
                        isDense: true,
                        hintText: "********",
                        helperText: "Password length should be more than 7"),
                    cursorColor: Theme.of(context).primaryColor,
                    validator: (value) {
                      if (_pswd.text.length >= 8) {
                        return null;
                      }
                      return "Enter Valid password";
                    },
                  ),
                  //Vertical Space

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
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print("Validated: " + _email.text + "," + _pswd.text);
                          showStatus(context);
                          var msg = AuthService().handleSignUp(
                            email: _email.text,
                            password: _pswd.text,
                            role: role,
                            context: context,
                            name: _name.text,
                            phoneNo: _phoneNo.text,
                          );
                          print("User Added: ");
                          // if (msg.toString() == "") {
                          //   showModalBottomSheet(
                          //       context: context,
                          //       builder: (context) {
                          //         return Container(child: Text("Loading..."));
                          //       });
                          // } else {
                          // }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showStatus(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.h),
          topRight: Radius.circular(15.h),
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: Container(
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please wait verifying details...", //CHECKIT
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
