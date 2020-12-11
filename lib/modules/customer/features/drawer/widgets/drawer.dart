import 'package:couriermanagementsystem/modules/customer/features/drawer/data/drawer_menu_data.dart';
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerWidget extends StatefulWidget {
  static const routeName = "/DrawerWidget";
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    ///ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      //For Redmi Note 9
      width: 392.72727272727275,
      height: 850.9090909090909,
      //For Redmi Note 7 pro
      //width: 360,
      //height: 720,
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
                    print("navigate to Signup Page");
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sign up/Login now",
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
                      _sendMail();
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

  //Contact us
  _sendMail() async {
    // Android and iOS
    const url =
        'mailto:b180001@nitsikkim.ac.in?subject=Feedback%20for%20CourierWay&body=Hello%20Adarsh,%0D%0A';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
