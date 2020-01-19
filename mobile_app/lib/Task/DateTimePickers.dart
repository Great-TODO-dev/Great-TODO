import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import '../Stores/Task.dart';
import '../Locals/locals.dart';
import '../widgets/VerticalDivider.dart' as paint;

class DateTimePickers extends StatefulWidget {
  DateTimePickers();

  _DateTimePickersState createState() => _DateTimePickersState();
}

class _DateTimePickersState extends State<DateTimePickers> {
  Future<void> _chooseDoDate() async {
    final task = Provider.of<Task>(context, listen: false);
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      initialDate: task.date == null ? DateTime.now() : task.date,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (date == null) {
      return;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: task.date == null
          ? TimeOfDay.now()
          : TimeOfDay.fromDateTime(task.date),
    );
    if (time == null) {
      return;
    }
    final resDateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    task.setDate(resDateTime);
    setState(() {});
  }

  Future<void> _chooseDueDate() async {
    final task = Provider.of<Task>(context, listen: false);
    final date = await showDatePicker(
      context: context,
      firstDate: task.deadline == null
          ? DateTime.now()
          : task.deadline.isAfter(DateTime.now())
              ? DateTime.now()
              : task.deadline,
      lastDate: DateTime(2025),
      initialDate: task.deadline == null ? DateTime.now() : task.deadline,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (date == null) {
      return;
    }
    task.setDeadline(date);
    setState(() {});
  }

  String _prepareText(DateTime deadline) {
    final dayDelta = deadline.day - DateTime.now().day;
    if (dayDelta == 0) {
      return Locals.today;
    }
    if (dayDelta <= 7) {
      return "$dayDelta ${Locals.daysLeft}";
    }
    final weeksDelta = dayDelta ~/ 7;
    if (weeksDelta <= 6) {
      return "$weeksDelta ${Locals.weeksLeft}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context, listen: false);
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () => _chooseDoDate(),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    task.date == null
                        ? 'No date selected'
                        : DateFormat('MM/dd HH:mm').format(task.date),
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                if (task.date != null)
                  IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () => setState(() => task.clearDate()),
                  )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
          child: CustomPaint(
            painter: paint.VerticalDivider(),
          ),
        ),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () => _chooseDueDate(),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.flag,
                  size: 30,
                  color: task.deadline != null && task.isDeadlineToday()
                      ? Colors.red
                      : Colors.blue,
                ),
                Expanded(
                  child: Text(
                    task.deadline == null
                        ? 'No date selected'
                        : _prepareText(task.deadline),
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
                if (task.deadline != null)
                  IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () => setState(() => task.clearDeadLine()),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
