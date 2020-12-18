import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Company Name of Application
const String companyName = "CourierWay";

/// Widgets
Row get dashedDivider => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        40,
        (index) => Container(
          width: 3,
          height: 2,
          color: Colors.blueGrey.withOpacity(0.3),
        ),
      ),
    );

const SizedBox spacer = const SizedBox(
  height: 15,
);

Widget dividingLine() {
  return Divider(
    color: Colors.black12,
    thickness: 2,
  );
}

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _controller.forward();

    _controller.addListener(listener);
  }

  void listener() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    }
    this.setState(() {});
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
      color: Colors.white,
      width: 100.w,
      height: 100.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            "CW",
            style: TextStyle(color: Colors.teal),
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.black,
            valueColor:
                ColorTween(begin: Colors.grey, end: Colors.grey.shade100)
                    .animate(_controller),
          ),
        ],
      ),
    );
  }
}
