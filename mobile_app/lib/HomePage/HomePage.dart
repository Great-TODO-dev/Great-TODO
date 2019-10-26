import 'package:flutter/material.dart';

import './section.dart';
import '../Locals/locals.dart';

class HomePage extends StatelessWidget {
  final NAME = 'Name doesn`t matter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Hi");
            Navigator.pushNamed(context, "/todayTab");
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 30,
            ),
        ),
        appBar: AppBar(
          title: Text(NAME),
        ),
        body: ListView(
          children: [
            Section(Locals.today, '3'),
            Section(Locals.upComing),
            Section(Locals.anyTime),
            Section(Locals.someTime),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: CustomPaint(
                painter: DarkLine(),
              ),
            )
          ],
        ),
      );
  }
}


class DarkLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black38;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;
    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
