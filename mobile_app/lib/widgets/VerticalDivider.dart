import 'package:flutter/material.dart';

class VerticalDivider extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Color.fromRGBO(64, 59, 59, 1);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;
    print(size);
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
