import 'package:couriermanagementsystem/core/data/dummy_data.dart';
import 'package:couriermanagementsystem/core/models/courier_model.dart';
import 'package:couriermanagementsystem/modules/admin/features/detail_pages/widgets/helper_widgets.dart';
import 'package:couriermanagementsystem/modules/admin/features/home/services/admin_info_services.dart';
import 'package:couriermanagementsystem/modules/employee/home/models/employee_model.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'courier_editing_services.dart';

//CHECKIT
class AssignEmployee extends StatefulWidget {
  final Courier courier;

  const AssignEmployee({Key key, @required this.courier}) : super(key: key);
  @override
  _AssignEmployeeState createState() => _AssignEmployeeState();
}

class _AssignEmployeeState extends State<AssignEmployee> {
  Employee _deliveryMan;
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
              buildTitle(title: "Assign Employee"),
              SizedBox(
                width: 10,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Employee>(
                  value: _deliveryMan,
                  isDense: true,
                  onChanged: (Employee newValue) {
                    setState(
                      () {
                        Provider.of<EditCourier>(context, listen: false)
                            .setDeliveryMan(newValue);
                        _deliveryMan = newValue;
                        print("Assigned Employee: ${newValue.name}");
                      },
                    );
                  },
                  items:
                      // Provider.of<AdminInfoServices>(context,listen:false)
                      //     .adminData
                      // .employees
                      dummyemployees.map(
                    (Employee value) {
                      return DropdownMenuItem<Employee>(
                        value: value,
                        child: Text(value.name),
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