import 'package:couriermanagementsystem/shared/theme.dart';

import 'shipment_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackCourier extends StatefulWidget {
  const TrackCourier({
    Key key,
  }) : super(key: key);

  @override
  _TrackCourierState createState() => _TrackCourierState();
}

class _TrackCourierState extends State<TrackCourier> {
  @override
  Widget build(BuildContext context) {
    /// ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      width: 392.72727272727275,
      height: 850.9090909090909,
      allowFontScaling: true,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          child: RichText(
            text: TextSpan(
              text: "Let's",
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
              children: [
                TextSpan(
                  text: " track",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    color: appThemeColor1,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: " your courier...",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        //Vertical Space
        SizedBox(
          height: 5.h,
        ),
        Card(
          elevation: 2,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Container(
            height: 250.h,
            width: double.maxFinite,
            child: ShipmentNumberWidget(),
          ),
        ),
      ],
    );
  }
}
