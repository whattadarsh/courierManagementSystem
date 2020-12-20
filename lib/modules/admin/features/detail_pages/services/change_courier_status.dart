import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/widgets/helper_widgets.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'courier_editing_services.dart';

class ChangeCourierStatus extends StatefulWidget {
  final Courier courier;

  const ChangeCourierStatus({Key key, @required this.courier})
      : super(key: key);
  @override
  _ChangeCourierStatusState createState() => _ChangeCourierStatusState();
}

//CHECKIT
class _ChangeCourierStatusState extends State<ChangeCourierStatus> {
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
              buildTitle(title: "Shipment Status"),
              SizedBox(
                width: 10,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<courierStatus>(
                  value: widget.courier.status,
                  isDense: true,
                  onChanged: (courierStatus newValue) {
                    setState(
                      () {
                        Provider.of<EditCourier>(context)
                            .changeStatus(newValue);
                        // state.didChange(newValue);
                        print("Status changed to $newValue");
                      },
                    );
                  },
                  items: courierStatus.values.map(
                    (courierStatus value) {
                      return DropdownMenuItem<courierStatus>(
                        value: value,
                        child: Text(EnumToString.convertToString(value)),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
