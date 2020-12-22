import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoAddressesPresentWidget extends StatelessWidget {
  const NoAddressesPresentWidget({
    Key key,
  }) : super(key: key);

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
      allowFontScaling: true,
    );
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Text(
          "You don't have any Address saved. Add one now so that we can reach you more quickly",
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.blue,
            // fontFamily: "Open Sans",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
