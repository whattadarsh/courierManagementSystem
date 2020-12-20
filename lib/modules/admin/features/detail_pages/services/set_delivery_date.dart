import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/services/courier_editing_services.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/widgets/helper_widgets.dart';
import 'package:couriermanagementsystem/shared/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetDeliveryDate extends StatefulWidget {
  final Courier courier;

  const SetDeliveryDate({Key key, @required this.courier}) : super(key: key);
  @override
  _SetDeliveryDateState createState() => _SetDeliveryDateState();
}

//CHECKIT: Add Provider
class _SetDeliveryDateState extends State<SetDeliveryDate> {
  DateTime dt;
  List<DropdownMenuItem> items;
  @override
  void initState() {
    // dt = DateTime.now();
    items = new List.generate(10, (index) => index + 2).map(
      (int addDays) {
        return new DropdownMenuItem<DateTime>(
          value: DateTime.now().add(Duration(days: addDays)),
          child: Text(
              dateTimetoString(DateTime.now().add(Duration(days: addDays)))),
        );
      },
    ).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(title: "Expected Delivery Date: "),
              SizedBox(width: 10),
              DropdownButtonHideUnderline(
                child: DropdownButton<DateTime>(
                  value: dt,
                  isDense: true,
                  onChanged: (DateTime newValue) {
                    setState(
                      () {
                        Provider.of<EditCourier>(context, listen: false)
                            .setDeliveryDate(newValue);
                        dt = newValue;
                        print("Delivery Date : ${dateTimetoString(newValue)}");
                      },
                    );
                  },
                  items: items,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
