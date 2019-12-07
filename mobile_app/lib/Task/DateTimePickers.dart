import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import '../Stores/Task.dart';

class DateTimePickers extends StatefulWidget {
  DateTimePickers();

  _DateTimePickersState createState() => _DateTimePickersState();
}

class _DateTimePickersState extends State<DateTimePickers> {
  Future<DateTime> _chooseDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2020),
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (date == null) {
      return null;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    final resTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    print(resTime);
    return resTime;
  }

  Future<void> _chooseDoDate() async {
    Provider.of<Task>(context).setDate(await _chooseDate());
    setState(() {});
  }

  Future<void> _chooseDueDate() async {
    Provider.of<Task>(context, listen: false).setDeadline(await _chooseDate());
    setState(() {});
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
                Text(
                  task.date == null
                      ? 'No date selected'
                      : DateFormat('MM/dd HH:mm').format(task.date),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                if (task.date != null)
                IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () => setState(() {
                    task.clearDate();
                  }),
                )
              ],
            ),
          ),
        ),
        VerticalDivider(color: Colors.red),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () => _chooseDueDate(),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.flag,
                  size: 30,
                  color: Colors.blue,
                ),
                Text(
                  'No date selected',
                  style: TextStyle(color: Colors.white),
                ),
                if (task.deadline != null)
                IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () {},
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
