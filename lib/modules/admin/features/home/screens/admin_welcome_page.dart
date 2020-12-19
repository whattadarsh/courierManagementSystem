import 'package:couriermanagementsystem/modules/admin/features/drawer/widgets/admin_drawer.dart';
import 'package:couriermanagementsystem/modules/admin/features/home/widgets/couriers_list.dart';
import 'package:couriermanagementsystem/modules/admin/features/home/widgets/employee_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:couriermanagementsystem/modules/customer/features/tracking_page/widgets/tracking_widget.dart';

class AdminWelcomePage extends StatefulWidget {
  static const routeName = "/AdminWelcomePage";

  @override
  _AdminWelcomePageState createState() => _AdminWelcomePageState();
}

class _AdminWelcomePageState extends State<AdminWelcomePage> {
  GlobalKey<ScaffoldState> scaffoldKey;
  String role;
  @override
  void initState() {
    scaffoldKey = new GlobalKey<ScaffoldState>();
    role = "";
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   var user = FirebaseAuth.instance.currentUser;
    //   Provider.of<AdminInfoServices>(context, listen: false)
    //       .setUserId(userId: user.uid, email: user.email, context: context);
    //
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, String> args = ModalRoute.of(context).settings.arguments;
    // role = args["role"] ?? "";

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
          text: "Hey ",
          style: TextStyle(
            fontSize: 25.sp,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: "admin!", //TODO: Change with customer name if logged in
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
              EmployeeList(use: "Widget"),

              /// Couriers List
              CouriersList(use: "Widget"),
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
      drawer: AdminDrawerWidget(),
      // Disable opening the drawer with a swipe gesture.
      // drawerEnableOpenDragGesture: false,
      body: _body,
    );
  }
}
