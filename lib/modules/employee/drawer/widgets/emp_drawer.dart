import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Project Imports
import '../../../../shared/theme.dart';
import '../../../../core/screens/contact_us.dart';
import '../../../../core/authentication/services/auth.dart';
import '../../../../modules/customer/features/drawer/data/drawer_menu_data.dart';

class EmpDrawerWidget extends StatefulWidget {
  static const routeName = "/EmpDrawerWidget";
  @override
  _EmpDrawerWidgetState createState() => _EmpDrawerWidgetState();
}

class _EmpDrawerWidgetState extends State<EmpDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    ///ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      designSize: Size(
        392.72727272727275,
        850.9090909090909,
      ),
      allowFontScaling: true,
    );
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/6447.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "Courier",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: "Way",
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700,
                              color: appThemeColor1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Signup Invitation
                FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    print("navigate to Onboarding");
                    AuthService().signout(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sign out",
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
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                Map<String, Object> selectedOption = menuData[index];
                return ListTile(
                  title: Text(
                    selectedOption["title"],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: Icon(
                    selectedOption["icon"],
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 15.sp,
                  ),
                  onTap: () {
                    if (selectedOption["title"] == 'Contact Us') {
                      contactUs();
                    } else {
                      Navigator.of(context)
                          .popAndPushNamed(selectedOption["navigateTo"]);
                    }
                  },
                );
              },
              itemCount: menuData.length,
            ),
          )
        ],
      ),
    );
  }
}
