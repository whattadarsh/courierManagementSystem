import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Project Imports
import '../widgets/address_body.dart';

class MyAddresses extends StatefulWidget {
  static const routeName = "/MyAddresses";
  @override
  _MyAddressesState createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "ADDRESS BOOK",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: AddressBody(),
    );
  }
}
