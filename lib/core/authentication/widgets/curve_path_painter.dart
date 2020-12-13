// import 'package:flutter/material.dart';

// class CurvePainter extends CustomPainter {
//   // @override
//   // void paint(Canvas canvas, Size size) {
//   //   var paint = Paint();

//   //   paint.color = Colors.lightBlue;
//   //   paint.style = PaintingStyle.stroke;
//   //   paint.strokeWidth = 3;

//   //   var startPoint = Offset(0, size.height / 2);
//   //   var controlPoint1 = Offset(size.width / 4, size.height / 3);
//   //   var controlPoint2 = Offset(3 * size.width / 4, size.height / 3);
//   //   var endPoint = Offset(size.width, size.height / 2);

//   //   var path = Path();
//   //   path.moveTo(startPoint.dx, startPoint.dy);
//   //   path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
//   //       controlPoint2.dy, endPoint.dx, endPoint.dy);
//   //   canvas.drawPath(
//   //     dashPath(
//   //       path,
//   //       dashArray: CircularIntervalList<double>(<double>[15.0, 10.5]),
//   //     ),
//   //     paint,
//   //   );
//   //   canvas.drawPath(path, paint);
//   // }

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0;

//     Path path = Path();
//     path.moveTo(0, 0);
//     path.quadraticBezierTo(
//         size.width / 2, size.height, size.width, size.height / 2);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
