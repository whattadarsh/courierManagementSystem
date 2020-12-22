import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedLoadingHomeScreen extends StatefulWidget {
  @override
  _AnimatedLoadingHomeScreenState createState() =>
      _AnimatedLoadingHomeScreenState();
}

class _AnimatedLoadingHomeScreenState extends State<AnimatedLoadingHomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _animationLeft;
  Animation<Color> _animationRight;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animationLeft = ColorTween(begin: Colors.grey, end: Colors.grey.shade100)
        .animate(_controller);

    _animationRight = ColorTween(begin: Colors.grey.shade100, end: Colors.grey)
        .animate(_controller);

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// ScreenUtil for Responsive UI
    ScreenUtil.init(
      context,
      designSize: Size(
        392.72727272727275,
        850.9090909090909,
      ),
      allowFontScaling: true,
    );
    return Container(
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            colors: [_animationLeft.value, _animationRight.value],
          ).createShader(rect);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 50.h,
            ),
            Container(
              height: 200.h,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.h)),
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            // List
            ...List.generate(
              3,
              (index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Container(
                    height: 100.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.h)),
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
