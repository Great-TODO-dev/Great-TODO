import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Stores/Task.dart';
import '../../Locals/locals.dart';

import '../../Task/TaskLabel.dart';

class TasksSection extends StatelessWidget {
  final int _date;
  final List<Task> _tasks;

  const TasksSection(this._date, this._tasks);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
            child: Row(children: [
              Text(
                _date.toString(),
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                width: 15,
              ),
              if (DateTime.now().day == _date)
                Text(
                  Locals.today,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )
            ]),
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
            child: CustomPaint(
              painter: DarkLine(),
            ),
          ),
          ..._tasks.map((task) {
            return ChangeNotifierProvider.value(
              value: task,
              child: TaskLabel(),
            );
          }).toList()
        ],
      ),
    );
  }
}

class DarkLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color.fromRGBO(64, 59, 59, 1);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;
    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
