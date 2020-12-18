import 'package:couriermanagementsystem/modules/customer/features/tracking_page/data/more_features_on_courierway.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreOnCourierWay extends StatefulWidget {
  @override
  _MoreOnCourierWayState createState() => _MoreOnCourierWayState();
}

class _MoreOnCourierWayState extends State<MoreOnCourierWay> {
  @override
  Widget build(BuildContext context) {
    /// ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      designSize: Size(
        392.72727272727275,
        850.9090909090909,
      ),
      allowFontScaling: true,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Vertical Space
        SizedBox(
          height: 20.h,
        ),
        Container(
          padding: EdgeInsets.all(8.w),
          alignment: Alignment.centerLeft,
          child: Text(
            "More from $companyName",
            style: TextStyle(
              fontSize: 20.sp,
              color: appThemeColor6,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        //Vertical Space
        SizedBox(
          height: 10.h,
        ),
        ...moreOptions(),
      ],
    );
  }

  List<Widget> moreOptions() {
    return List.generate(
      moreOnCourierWay.length,
      (idx) {
        var cardItem = moreOnCourierWay[idx];
        return Card(
          margin: EdgeInsets.all(5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: ListTile(
            enabled: true,
            contentPadding: EdgeInsets.all(8.w),
            title: Text(
              cardItem['description'].toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              cardItem['icon'],
              color: Colors.black,
            ),
            onTap: () {
              print("Navigation to " + cardItem['navigateTo'].toString());
              Navigator.of(context).pushNamed(
                cardItem['navigateTo'].toString(),
              );
            },
          ),
          elevation: 1.5,
        );
      },
    );
  }
}
