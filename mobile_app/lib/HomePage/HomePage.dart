import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './InboxSection.dart';
import './section.dart';
import '../Locals/locals.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          InboxSection(Locals.inbox, 4),
          Section(
              Locals.today,
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30,
              ),
              '3'),
          Section(Locals.upComing,
              Icon(Icons.today, color: Colors.purple, size: 30)),
          Section(
              Locals.anyTime,
              Icon(
                Icons.calendar_today,
                color: Colors.lightGreen,
                size: 30,
              )),
          Section(
              Locals.someTime,
              Icon(
                Icons.indeterminate_check_box,
                color: Colors.brown,
                size: 30,
              )),
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

// var deviceSize = MediaQuery.of(context).size;

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
