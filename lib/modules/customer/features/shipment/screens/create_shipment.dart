import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Project Imports
import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:couriermanagementsystem/core/data/dummy_data.dart';
import 'package:couriermanagementsystem/core/models/courier_model.dart';

import '../../profile/models/address_model.dart';
import '../../address/widgets/add_new_address.dart';
import '../../profile/services/customer_info_services.dart';

class CreateShipment extends StatefulWidget {
  static const routeName = "/CreateShipment";
  @override
  _CreateShipmentState createState() => _CreateShipmentState();
}

class _CreateShipmentState extends State<CreateShipment> {
  Address _pickupAddress, _destAddress;
  GlobalKey<FormState> _formKey;
  TextEditingController _corName,
      _corUnitPrice,
      _corQuantity,
      _corWeight,
      _corlen,
      _corbreadth,
      _corheight;
  courierType _courierType;
  double _total;
  @override
  void initState() {
    _formKey = new GlobalKey<FormState>();
    _pickupAddress = dummyaddresses[0];
    _destAddress = dummyaddresses[1];
    _corName = new TextEditingController();
    _corUnitPrice = new TextEditingController();
    _corQuantity = new TextEditingController();
    _corWeight = new TextEditingController();
    _corlen = new TextEditingController();
    _corbreadth = new TextEditingController();
    _corheight = new TextEditingController();
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
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() {
              // isProcessing = true;
            });
            _formKey.currentState.save();
            int quan = int.tryParse(_corQuantity.text) ?? 1;
            double uprice = double.tryParse(_corUnitPrice.text) ?? 20.0;
            double _len = double.tryParse(_corlen.text) ?? 20.0;
            double _breadth = double.tryParse(_corbreadth.text) ?? 20.0;
            double _hght = double.tryParse(_corheight.text) ?? 20.0;
            double _wgt = double.tryParse(_corheight.text) ?? 2;

            double _total = quan * uprice;
            Courier c = Courier(
              courierName: _corName.text,
              type: _courierType,
              unitPrice: uprice,
              quantity: quan,
              totalPrice: _total,
              length: _len,
              breadth: _breadth,
              height: _hght,
              weight: _wgt,
              origin: _pickupAddress,
              destination: _destAddress,
              status: courierStatus.Pending,
            );
            await Provider.of<CustomerInfoServices>(context).createCourier(c);
            print("Courier Booked!!");
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Enter valid Details "),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
      ),
    );
  }

  Widget addressesCards() {
    return Column(
      mainAxisSize: MainAxisSize.min,
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

  Widget textField(
      {@required String field,
      @required TextEditingController controller,
      @required TextInputType keyboardType,
      @required String Function(String) validator}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: field,
        contentPadding: EdgeInsets.zero,
        isDense: true,
      ),
      validator: validator,
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
          // AddNewAddressWidget(),
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
                    items: Provider.of<CustomerInfoServices>(context)
                        .customerData
                        .fetchedAddress
                        .map(
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
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // AddNewAddressWidget(),
          //Pickup address
          FormField<Address>(
            builder: (FormFieldState<Address> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: "Delivery Address**",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  errorStyle: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16.sp,
                  ),
                  hintText: 'Please select delivery address',
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
                    value: _destAddress,
                    isDense: true,
                    onChanged: (Address newValue) {
                      setState(
                        () {
                          _pickupAddress = newValue;
                          state.didChange(newValue);
                          print(
                              "Delivery ${newValue.addressTag} selected: ${newValue.addressString()}");
                        },
                      );
                    },
                    items: Provider.of<CustomerInfoServices>(context)
                        .customerData
                        .fetchedAddress
                        .map(
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
              keyboardType: TextInputType.name,
              controller: _corName,
              validator: (value) {
                if (_corName.text.length >= 3) {
                  return null;
                }
                return "Enter name atleast with 3 characters";
              },
            ), //1
            // Vertical Space
            spacer,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: textField(
                    keyboardType: TextInputType.number,
                    field: "Add Unit Price*",
                    controller: _corUnitPrice,
                    validator: (value) {
                      if (double.tryParse(_corUnitPrice.text) != null) {
                        return null;
                      }
                      return "Enter valid price";
                    },
                  ),
                ), //5
                //Horizontal Space
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                  child: textField(
                    keyboardType: TextInputType.number,
                    field: "Add Quantity*",
                    controller: _corQuantity,
                    validator: (value) {
                      if (int.tryParse(_corQuantity.text) != null) {
                        return null;
                      }
                      return "Enter valid number";
                    },
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
                    keyboardType: TextInputType.number,
                    controller: _corWeight,
                    validator: (value) {
                      if (double.tryParse(_corWeight.text) != null) {
                        return null;
                      }
                      return "Enter valid number";
                    },
                  ),
                ),
                Text(
                  "(kg)",
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
                        keyboardType: TextInputType.number,
                        controller: _corlen,
                        decoration:
                            InputDecoration(hintText: "L", isDense: true),
                        validator: (value) {
                          if (double.tryParse(_corlen.text) != null) {
                            return null;
                          }
                          return "Enter valid number";
                        },
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
                        keyboardType: TextInputType.number,
                        controller: _corbreadth,
                        validator: (value) {
                          if (double.tryParse(_corbreadth.text) != null) {
                            return null;
                          }
                          return "Enter valid number";
                        },
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
                        controller: _corheight,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (double.tryParse(_corheight.text) != null) {
                            return null;
                          }
                          return "Enter valid number";
                        },
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
                    _courierType = (index == 0)
                        ? courierType.Document
                        : courierType.Nondocument;
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
