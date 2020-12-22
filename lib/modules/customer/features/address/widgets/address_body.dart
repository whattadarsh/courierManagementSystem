import 'package:couriermanagementsystem/modules/customer/features/address/services/adding_address_provider.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/services/customer_info_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Project Imports
import 'address_list.dart';
import 'no_addresses.dart';
import 'add_new_address.dart';

class AddressBody extends StatefulWidget {
  @override
  _AddressBodyState createState() => _AddressBodyState();
}

class _AddressBodyState extends State<AddressBody> {
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
    return Consumer<CustomerInfoServices>(
      builder: (context, userInfo, _) {
        return CustomScrollView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20.w),
                child: ChangeNotifierProvider<AddAddress>(
                  create: (context) => AddAddress(),
                  builder: (context, addAddress) => Column(
                    children: <Widget>[
                      Provider.of<AddAddress>(context).showAddAddress
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 13.sp,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Add Address",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  Provider.of<AddAddress>(context,
                                          listen: false)
                                      .toggleaddAddressButton();
                                  Navigator.of(context).pushNamed(
                                      AddNewAddressWidget.routeName,
                                      arguments: {
                                        "context": context,
                                        "userinfo": userInfo
                                      });
                                  print("Adding a new address form");
                                  setState(() {});
                                },
                              ),
                            )
                          : Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10.h,
                                ),

                                //AddNewAddressWidget(userInfo: userInfo),
                              ],
                            ), //Editing tile
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Saved Addresses",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    // fontFamily: "Open Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            (userInfo.customerData != null &&
                    userInfo.customerData.userAddresses.isEmpty)
                ? NoAddressesPresentWidget()
                : AddressList(
                    onTap: () {},
                  ) //List of Saved Addresses
          ],
        );
      },
    );
  }
}
