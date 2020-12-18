import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({
    Key key,
  }) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  var spacer = SizedBox(
    height: 10,
  );

  void showSignUpFormWidget(BuildContext context) {
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
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "CourierWay Registration",
                  style: TextStyle(
                    fontSize: 20.sp,
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
                  // controller: controller,
                  decoration: InputDecoration(
                    labelText: "Email*",
                    isDense: true,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                //Vertical Space
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  // controller: controller,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password*",
                    isDense: true,
                  ),
                  cursorColor: Theme.of(context).primaryColor,
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
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    onPressed: () {
                      print("Registering Please Wait");
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
    Widget textField(
        {@required String field, TextEditingController controller}) {
      return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: field,
          contentPadding: EdgeInsets.zero,
          isDense: true,
        ),
        cursorColor: Theme.of(context).primaryColor,
      );
    }

    Widget bottomSheet = Container(
      padding: EdgeInsets.all(15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.wysiwyg_outlined),
              //Horizontal Space
              SizedBox(
                width: 5.w,
              ),
              Text(
                "Add Address",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
              ),
            ],
          ),
          // Vertical Space
          spacer,
          textField(
            field: "Seller Name*",
          ), //1
          // Vertical Space
          spacer,
          textField(
            field: "Phone Number*",
          ), //2
          // Vertical Space
          spacer,
          textField(
            field: "House No.*",
          ), //3
          // Vertical Space
          spacer,
          textField(
            field: "Street No. and Landmark*",
          ), //4
          // Vertical Space
          spacer,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: textField(
                  field: "Pincode*",
                ),
              ), //5
              //Horizontal Space
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: textField(
                  field: "City*",
                ),
              ), //6
            ],
          ),
          // Vertical Space
          spacer,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: textField(
                  field: "State*",
                ),
              ), //7
              //Horizontal Space
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: textField(
                  field: "Country*",
                ),
              ), //8
            ],
          ),
        ],
      ),
    );

    // showModalBottomSheet(
    //   context: context,
    //   backgroundColor: Colors.white,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
    //   ),
    //   builder: (context) {
    //     return Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         ListTile(
    //           leading: Icon(Icons.email),
    //           title: Text('Send email'),
    //           onTap: () {
    //             print('Send email');
    //           },
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.phone),
    //           title: Text('Call phone'),
    //           onTap: () {
    //             print('Call phone');
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
    return FlatButton(
      onPressed: () {}, //TODO: Add a bottom sheet option for add an address
      padding: EdgeInsets.zero,
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
    );
  }
}
