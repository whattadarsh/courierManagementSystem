import 'package:flutter/material.dart';
import 'animated_loading_homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedJoiningScreen extends StatefulWidget {
  const AnimatedJoiningScreen({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedJoiningScreenState createState() => _AnimatedJoiningScreenState();
}

class _AnimatedJoiningScreenState extends State<AnimatedJoiningScreen>
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                colors: [_animationLeft.value, _animationRight.value],
              ).createShader(rect);
            },
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: RichText(
                text: TextSpan(
                  text: "CourierWay" ?? "",
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        AnimatedLoadingHomeScreen(),
      ],
    );
  }
}
