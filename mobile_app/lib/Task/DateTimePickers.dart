import 'package:flutter/material.dart';
import 'dart:async';

class DateTimePickers extends StatefulWidget {
  DateTimePickers();

  _DateTimePickersState createState() => _DateTimePickersState();
}

class _DateTimePickersState extends State<DateTimePickers> {
  Future<void> _chooseDate() async {
    final dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2020),
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    );
  }

  // void

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () => _chooseDate(),
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
                  'No date selected',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
        ),
        VerticalDivider(color: Colors.red),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              print('pressed 2');
            },
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
