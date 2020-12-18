import 'package:couriermanagementsystem/modules/customer/features/profile/data/address.dart';
import 'package:couriermanagementsystem/modules/customer/features/profile/models/address_model.dart';
import 'package:couriermanagementsystem/modules/customer/features/shipment/widgets/add_address.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateShipment extends StatefulWidget {
  static const routeName = "/CreateShipment";
  @override
  _CreateShipmentState createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<CreateShipment> {
  Address _pickupAddress;
  GlobalKey<FormState> _formKey;
  List<TextEditingController> deliveryAddress;
  List<TextEditingController> productDetails;
  String _courierType;
  @override
  void initState() {
    _formKey = new GlobalKey<FormState>();
    _pickupAddress = addresses[0];
    deliveryAddress = List.generate(8, (index) => TextEditingController());
    productDetails = List.generate(7, (index) => TextEditingController());
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
      appBar: AppBar(
        title: Text("Create Shipment"),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// Addresses: Seller and Reciever
                addressesCards(),
                SizedBox(
                  height: 5.h,
                ),

                /// Product Details
                _productDetailsCard(),
                SizedBox(
                  height: 10.h,
                ),
                createOrderButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container createOrderButton() {
    return Container(
      margin: EdgeInsets.all(10.w),
      width: double.infinity,
      child: RaisedButton(
        color: appThemeColor1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(30.w)),
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Text(
            "Create an Shipment",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
        ),
        onPressed: () {
          //TODO: Implement This
          print("Courier Booked!!");
        },
      ),
    );
  }

  Widget addressesCards() {
    return Column(
      children: [
        Card(
          child:
              //Pickup Address
              _pickupAddressField(),
        ),
        SizedBox(
          height: 5.h,
        ),
        Card(
          child:
              // Delivery Address
              _deliveryAddressField(),
        ),
      ],
    );
  }

  Widget textField({@required String field, TextEditingController controller}) {
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

  Widget _pickupAddressField() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddAddress(),
          //Pickup address
          FormField<Address>(
            builder: (FormFieldState<Address> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: "Pickup Address**",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16.sp,
                  ),
                  hintText: 'Please select pickup address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                isEmpty: _pickupAddress.addressTag == "",
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Address>(
                    value: _pickupAddress,
                    isDense: true,
                    onChanged: (Address newValue) {
                      setState(
                        () {
                          _pickupAddress = newValue;
                          state.didChange(newValue);
                          print(
                              "${newValue.addressTag} selected: ${newValue.addressString()}");
                        },
                      );
                    },
                    items: addresses.map(
                      (Address value) {
                        return DropdownMenuItem<Address>(
                          value: value,
                          child: Text(value.addressTag),
                        );
                      },
                    ).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _deliveryAddressField() {
    return Container(
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
                "Delivery Address",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
              ),
            ],
          ),
          // Vertical Space
          spacer,
          textField(
            field: "Reciever's Name*",
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
  }

  Widget _productDetailsCard() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.view_in_ar),
                //Horizontal Space
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Courier Details",
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
                ),
              ],
            ),
            // Vertical Space
            spacer,
            textField(
              field: "Add Product/Courier Name*",
            ), //1
            // Vertical Space
            spacer,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: textField(
                    field: "Add Unit Price*",
                  ),
                ), //5
                //Horizontal Space
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                  child: textField(
                    field: "Add Quantity*",
                  ),
                ), //6
              ],
            ),
            // Vertical Space
            spacer,

            ///Weight
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: textField(
                    field: "Weight*",
                  ),
                ),
                Text(
                  "(cm)",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            //Vertical Space
            SizedBox(
              height: 15.h,
            ),

            ///Dimensions
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Dimensions*",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Horizontal Space
                    SizedBox(
                      width: 5.w,
                    ),
                    Flexible(
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: "L", isDense: true),
                      ),
                    ),
                    //Horizontal Space
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "X",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ), //7
                    //Horizontal Space
                    SizedBox(
                      width: 5.w,
                    ),
                    Flexible(
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: "B", isDense: true),
                      ),
                    ),
                    //Horizontal Space
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "X",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ), //7
                    //Horizontal Space
                    SizedBox(
                      width: 5.w,
                    ),
                    Flexible(
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: "H", isDense: true),
                      ),
                    ),
                    Text(
                      "(cm)",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Courier Type*",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 15.sp,
                        icon: Icon(
                          Icons.info_outline,
                        ),
                        tooltip:
                            "Select the type of courier document or non-document",
                        onPressed: null,
                      )
                    ],
                  ),
                ),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  cornerRadius: 20.w,
                  minWidth: 150.w,
                  fontSize: 16.sp,
                  activeBgColor: appThemeColor1,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.blueGrey[100],
                  inactiveFgColor: Colors.black,
                  labels: ["Document", "Non-Document"],
                  onToggle: (index) {
                    _courierType = (index == 0) ? "Document" : 'Non-Document';
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: double.infinity,
                  height: 3.h,
                  color: Colors.grey[400],
                ),
                spacer,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total: ", //TODO:${unitPrice * Quantity}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
