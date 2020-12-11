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
  @override
  Widget build(BuildContext context) {
    ///ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      //For Redmi Note 9
      width: 392.72727272727275,
      height: 850.9090909090909,
      allowFontScaling: true,
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
