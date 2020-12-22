import 'package:couriermanagementsystem/core/authentication/screens/signup_page.dart';
import 'package:couriermanagementsystem/core/authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  static const routeName = "/Login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String lottiePath, role;
  TextEditingController _email, _pswd;
  GlobalKey<FormState> _formKey;
  GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  void initState() {
    _email = new TextEditingController();
    _pswd = new TextEditingController();
    _formKey = new GlobalKey<FormState>();
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    role = "";
    lottiePath = "assets/lottieFiles/delivery_truck.json";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> args = ModalRoute.of(context).settings.arguments;
    lottiePath = args["lottie"];
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
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
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
                      lottiePath,
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
                    "CourierWay",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontFamily: 'Raleway',
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  //Vertical Space
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
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
                    controller: _pswd,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password*",
                        isDense: true,
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
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        //TODO: Redirect to Welcome Page after validation from DB
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print("Validated: " + _email.text + "," + _pswd.text);
                          showStatus(context);
                          var msg = await AuthService().handleSignInEmail(
                            _email.text,
                            _pswd.text,
                            role,
                            context,
                          );
                          print("User Added: ");
                          // if (msg.toString() == "") {
                          //   showModalBottomSheet(
                          //       context: context,
                          //       builder: (context) {
                          //         return Container(child: Text("Loading..."));
                          //       });
                          // }
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      print("navigate to Signup Page");
                      // showSignUpFormWidget(context);
                      Navigator.of(context).pushReplacementNamed(
                        Signup.routeName,
                        arguments: {"role": role},
                      );
                    },
                    child: Text(
                      "Register yourself",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15.sp,
                      ),
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
