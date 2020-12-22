// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:math' as math;

// class AnimatedLoadingScrenn extends StatefulWidget {
//   final double size;
//   final Color secondaryColor;
//   final Color primaryColor;
//   final int lapDuration;
//   final double strokeWidth;
//   AnimatedLoadingScrenn(
//       {@required this.size,
//       this.secondaryColor = Colors.white,
//       this.primaryColor = Colors.black,
//       this.lapDuration = 1000,
//       this.strokeWidth = 4.0});

//   @override
//   _AnimatedLoadingScrennState createState() => _AnimatedLoadingScrennState();
// }

// class _AnimatedLoadingScrennState extends State<AnimatedLoadingScrenn>
//     with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   Animation animation;

//   @override
//   void initState() {
//     super.initState();
//     controller = new AnimationController(
//         vsync: this, duration: Duration(milliseconds: widget.lapDuration))
//       ..repeat();
//   }

//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     /// ScreenUtil for Responsive UI
//     ScreenUtil.init(
//       context,
//       designSize: Size(
//         392.72727272727275,
//         850.9090909090909,
//       ),
//       allowFontScaling: true,
//     );
//     return Center(
//       child: Container(
//         child: Stack(
//           alignment: Alignment.lerp(Alignment.topCenter, Alignment.center, 0.4),
//           children: [
//             Text(
//               "cw",
//               style: TextStyle(
//                   fontSize: 30.sp,
//                   fontWeight: FontWeight.w600,
//                   fontStyle: FontStyle.normal),
//             ),
//             RotationTransition(
//               turns: Tween(
//                 begin: 0.0,
//                 end: 1.0,
//               ).animate(controller),
//               child: CustomPaint(
//                 painter: CirclePaint(
//                     secondaryColor: widget.secondaryColor,
//                     primaryColor: widget.primaryColor,
//                     strokeWidth: widget.strokeWidth),
//                 size: Size(widget.size, widget.size),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CirclePaint extends CustomPainter {
//   final Color secondaryColor;
//   final Color primaryColor;
//   final double strokeWidth;
//   double _degreeToRad(double degree) => degree * math.pi / 180;

//   CirclePaint(
//       {this.secondaryColor = Colors.grey,
//       this.primaryColor = Colors.blue,
//       this.strokeWidth = 15});
//   @override
//   void paint(Canvas canvas, Size size) {
// // 1
//     double centerPoint = size.height / 2;

//     Paint paint = Paint()
//       ..color = primaryColor
//       ..strokeCap = StrokeCap.round
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth;

// // 2
//     paint.shader = SweepGradient(
//       colors: [secondaryColor, primaryColor],
//       tileMode: TileMode.repeated,
//       startAngle: _degreeToRad(270),
//       endAngle: _degreeToRad(270 + 360.0),
//     ).createShader(
//         Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));

//     double startAngle = _degreeToRad(0);
//     double sweepAngle = _degreeToRad(360);

//     canvas.drawArc(Offset(0.0, 0.0) & Size(size.width, size.width), startAngle,
//         sweepAngle, false, paint..color = primaryColor);
//   }

//   @override
//   bool shouldRepaint(CirclePaint oldDelegate) {
//     return true;
//   }
// }
