import 'package:couriermanagementsystem/modules/customer/features/address/services/adding_address_provider.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/models/address_model.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/services/customer_info_services.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
class AddNewAddressWidget extends StatefulWidget {
  static const routeName = "./addnewaddress";

  @override
  _AddNewAddressWidgetState createState() => _AddNewAddressWidgetState();
}

class _AddNewAddressWidgetState extends State<AddNewAddressWidget> {
  GlobalKey<FormState> _formKey;

  bool isProcessing;
  TextEditingController address,
      name,
      mobile,
      country,
      houseNoAndLandmarkController,
      cityController,
      pincodeController,
      stateController;
  @override
  void initState() {
    super.initState();
    isProcessing = false;
    address = TextEditingController();
    houseNoAndLandmarkController = TextEditingController();
    cityController = TextEditingController();
    pincodeController = TextEditingController();
    stateController = TextEditingController();
    name = TextEditingController();
    mobile = TextEditingController();
    country = TextEditingController();
    _formKey = new GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("ADD ADDRESS"),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Container(
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
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        ),
                      ],
                    ),
                    // Vertical Space
                    spacer,
                    textField(
                      field: "Name*",
                      controller: name,
                    ), //1
                    // Vertical Space
                    spacer,
                    textField(
                      field: "Phone Number*",
                      controller: mobile,
                    ), //2
                    // Vertical Space
                    spacer,
                    textField(
                      field: "House No. and Landmark*",
                      controller: houseNoAndLandmarkController,
                    ), //4
                    // Vertical Space
                    spacer,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: textField(
                            field: "Pincode*",
                            controller: pincodeController,
                          ),
                        ), //5
                        //Horizontal Space
                        SizedBox(
                          width: 10.w,
                        ),
                        Flexible(
                          child: textField(
                            field: "City*",
                            controller: cityController,
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
                            controller: stateController,
                          ),
                        ), //7
                        //Horizontal Space
                        SizedBox(
                          width: 10.w,
                        ),
                        Flexible(
                          child: textField(
                            field: "Country*",
                            controller: country,
                          ),
                        ), //8
                      ],
                    ),
                    Container(
                      width: 300.w,
                      alignment: Alignment.center,
                      child: RaisedButton(
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(40.h),
                        // ),
                        color: appThemeColor1,
                        child: isProcessing
                            ? Center(
                                child: Text(
                                  "SAVING...",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    // fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            : Center(
                                child: Text(
                                  "SAVE ADDRESS",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    // fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                        onPressed: () async {
                          //Upload the Addresses
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isProcessing = true;
                            });
                            _formKey.currentState.save();
                            Address _newAddress = new Address(
                              name: name.text,
                              mobile: mobile.text,
                              country: country.text,
                              city: cityController.text,
                              pincode: pincodeController.text,
                              state: stateController.text,
                              addressTag:
                                  'Address ${Provider.of<CustomerInfoServices>(context, listen: false).customerData.userAddresses.length + 1}',
                              houseNoAndLandmark:
                                  houseNoAndLandmarkController.text,
                            );
                            await Provider.of<CustomerInfoServices>(context,
                                    listen: false)
                                .addAddress(_newAddress);

                            //Reset button
                            setState(() {
                              isProcessing = false;
                              Provider.of<AddAddress>(context, listen: false)
                                  .toggleaddAddressButton();
                            });
                            Navigator.of(context).pop();
                          } else {
                            print("Fields Empty");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Please Enter all the required fields correctly"),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget textField(
      {@required String field, @required TextEditingController controller}) {
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
// Column(
//                 children: <Widget>[
//                   // Text(
//                   //   "Enter Details for new Address",
//                   //   style: TextStyle(
//                   //     fontSize: 20.sp,
//                   //     color: Colors.black,
//                   //     // fontFamily: "Open Sans",
//                   //     fontWeight: FontWeight.w700,
//                   //   ),
//                   // ),
//                   //SizedBox(height: 10.h),
//                   formField("FIRST NAME", firstname),
//                   SizedBox(height: 10.h),
//                   formField("LAST NAME", lastname),
//                   SizedBox(height: 10.h),
//                   formField("MOBILE", mobile),
//                   SizedBox(height: 10.h),
//                   formField("COUNTRY", country),
//                   SizedBox(height: 10.h),
//                   formField("ADDRESS", address),
//                   SizedBox(height: 10.h),
//                   formField("TOWN/CITY", cityController),
//                   SizedBox(height: 10.h),
//                   formField("STATE", stateController),
//                   SizedBox(height: 10.h),
//                   formField("POSTCODE", pincodeController),
//                   SizedBox(height: 10.h),
//                   chooseLocation(),
//                   SizedBox(height: 10.h),
//                   Container(
//                     width: 300.w,
//                     alignment: Alignment.center,
//                     child: RaisedButton(
//                       // shape: RoundedRectangleBorder(
//                       //   borderRadius: BorderRadius.circular(40.h),
//                       // ),
//                       color: Colors.black,
//                       child: isProcessing
//                           ? Center(
//                               child: Text(
//                                 "SAVING...",
//                                 style: TextStyle(
//                                   fontSize: 18.sp,
//                                   color: Colors.white,
//                                   // fontFamily: "Open Sans",
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             )
//                           : Center(
//                               child: Text(
//                                 "SAVE ADDRESS",
//                                 style: TextStyle(
//                                   fontSize: 18.sp,
//                                   color: Colors.white,
//                                   // fontFamily: "Open Sans",
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                       onPressed: () async {
//                         //Upload the Addresses
//                         if (_formKey.currentState.validate()) {
//                           setState(() {
//                             isProcessing = true;
//                           });
//                           _formKey.currentState.save();
//                           Address _newAddress = new Address(
//                             firstname: firstname,
//                             address: address.text,
//                             mobile: mobile.text,
//                             country: country.text,
//                             city: cityController.text,
//                             pincode: pincodeController.text,
//                             state: stateController.text,
//                           );
//                           await userInfo.addAddress(_newAddress);

//                           //Reset button
//                           setState(() {
//                             isProcessing = false;
//                             Provider.of<AddAddress>(context_for_add_address,
//                                     listen: false)
//                                 .toggleaddAddressButton();
//                           });
//                           Navigator.of(context).pop();
//                         } else {
//                           print("Fields Empty");
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                   "Please Enter all the required fields correctly"),
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),

  Widget formField(String label, TextEditingController _controller) {
    //TextInputType t= TextInputType.
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        // border: OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(
          // fontFamily: "Open Sans",
          color: Colors.grey,
        ),
      ),
      validator: (value) {
        if (label == "Pincode*") {
          String pattern = r'(^[1-9]{1}[0-9]{5,8}$)';
          RegExp regExp = new RegExp(pattern);
          if (_controller.text == null || _controller.text.isEmpty) {
            return 'Enter pin code';
          } else if (!regExp.hasMatch(_controller.text)) {
            return "*Enter a valid pin code";
          }
          return null;
        } else {
          if (_controller.text == null || _controller.text.isEmpty) {
            return "Required field!!";
          }
          return null;
        }
      },
    );
  }
}
