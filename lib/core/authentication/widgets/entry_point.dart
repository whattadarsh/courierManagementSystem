import 'package:couriermanagementsystem/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EntryPoint extends StatefulWidget {
  final String title, path, lottiePath;
  const EntryPoint({
    Key key,
    @required this.title,
    @required this.path,
    @required this.lottiePath,
  }) : super(key: key);
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<EntryPoint> {
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
    return InkWell(
      onTap: () {
        print("Entering to ${widget.title} Panel (through ${widget.path})");
        Navigator.of(context).pushNamed(
          widget.path,
          arguments: {"lottie": widget.lottiePath, "role": widget.title},
        );
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey[50], width: 2.sp),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 80.h,
              child: Lottie.asset(
                widget.lottiePath,
                repeat: true,
                reverse: true,
                animate: true,
                frameRate: FrameRate(30),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: appThemeColor6,
                fontFamily: 'Roboto Slab',
                fontSize: 20.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
