import 'package:couriermanagementsystem/modules/admin/features/detail_pages/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'courier_editing_services.dart';

class SetDeliveryDate extends StatefulWidget {
  static const routeName = "/SetDeliveryDate";
  @override
  _SetDeliveryCharges createState() => _SetDeliveryCharges();
}

class _SetDeliveryCharges extends State<SetDeliveryDate> {
  TextEditingController deliveryCharges;
  @override
  void initState() {
    super.initState();
    deliveryCharges = new TextEditingController();
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
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(title: "Set Delivery Charges: "),
          SizedBox(
            width: 10.h,
          ),
          Flexible(
            child: TextFormField(
              controller: deliveryCharges,
              decoration: InputDecoration(
                labelText: "Delivery Charges",
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
              keyboardType: TextInputType.number,
              cursorColor: Theme.of(context).primaryColor,
              onEditingComplete: () {
                Provider.of<EditCourier>(context)
                    .setDeliveryCharges(double.parse(deliveryCharges.text));
              },
            ),
          ),
        ],
      ),
    );
  }
}
