import 'package:flutter/material.dart';

class Checkbox extends StatefulWidget {
  Checkbox();

  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {

  bool _doneState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 40,
        width: 40,
        child: Stack(alignment: AlignmentDirectional.center, children: [
          SizedBox(
            height: 40,
            width: 40,
            child: CustomPaint(
              painter: CheckboxArea(),
            ),
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: CustomPaint(
              painter: CheckMark(),
            ),
          )
        ]),
      ),
    );
  }
}

class CheckboxArea extends CustomPainter {
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Color.fromRGBO(59, 59, 59, 1);
    // paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(size.height / 2, size.width / 2),
                height: size.height,
                width: size.width),
            Radius.circular(5)),
        paint);
  }
}

class CheckMark extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    // paint.color = Color.fromRGBO(59, 59, 59, 1);
    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    canvas.drawLine(Offset(0, size.height / 4), Offset(size.width / 3, size.height / 1.5), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width / 3, size.height / 1.5), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
