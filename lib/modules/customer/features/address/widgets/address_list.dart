import 'package:couriermanagementsystem/modules/customer/features/profile/models/address_model.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/services/customer_info_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///Project Imports

class AddressList extends StatelessWidget {
  final Function onTap;
  const AddressList({Key key, @required this.onTap}) : super(key: key);

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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Address addr = Provider.of<CustomerInfoServices>(context)
              .customerData
              .fetchedAddress[index];
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 10.h),
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.h)),
                border: Border.all(
                  color: Colors.blueGrey.withOpacity(0.3),
                  width: 1.h,
                ),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      addr.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      addr.city,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      addr.state.toUpperCase() + " " + addr.pincode,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      addr.mobile,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: onTap,
          );
        },
        childCount: Provider.of<CustomerInfoServices>(context)
            .customerData
            .userAddresses
            .length,
      ),
    );
  }
}
