import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///Project Imports
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:couriermanagementsystem/core/data/dummy_data.dart';
import 'package:couriermanagementsystem/core/models/courier_model.dart';

import '../../detail_pages/screens/courier_details.dart';
import '../../detail_pages/services/courier_editing_services.dart';

class CouriersList extends StatefulWidget {
  final String use;

  const CouriersList({
    Key key,
    @required this.use,
  }) : super(key: key);

  @override
  _CouriersListState createState() => _CouriersListState();
}

class _CouriersListState extends State<CouriersList> {
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
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Vertical Space
          SizedBox(
            height: 10.h,
          ),
          widget.use != "Page"
              ? Container(
                  padding: EdgeInsets.all(8.w),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Available Couriers",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: appThemeColor6,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          //Vertical Space
          SizedBox(
            height: 10.h,
          ),
          ...generateCouriers(context),
          //Vertical Space
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: double.infinity,
            color: Colors.blueGrey[50],
            height: 2.h,
          ),
          //Vertical Space
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  List<Widget> generateCouriers(BuildContext context) {
    var couriers = dummycouriers;
    return List.generate(
      couriers.length,
      (int index) {
        Courier cour = couriers[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            Provider.of<EditCourier>(context, listen: false).courier = cour;
            Navigator.of(context).pushNamed(CourierDetails.routeName);
          },
          title: Card(
            margin: EdgeInsets.all(2.w),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                        child: Text(
                          "Product Name: " + cour.courierName,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                  //Vertical Space
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Origin: ${cour.origin.pincode}",
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ))),
                  //Vertical Space
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Destination: ${cour.destination.pincode}",
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      )),
                  //Vertical Space
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                      child: Text(
                        "current status: Pending ",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.redAccent,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
