import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import './TaskFullView.dart';

class Task extends StatefulWidget {
  final String name;
  bool state;
  Task(this.name, this.state);

  @override
  State<StatefulWidget> createState() {
    return _TaskState(name, state);
  }
}

class _TaskState extends State<Task> {
  final String name;
  bool checkboxState;
  _TaskState(this.name, this.checkboxState);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new TaskFullView(name)));
      },
      child: Container(
        padding: EdgeInsets.only(right: 15),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CupertinoSwitch(
                    value: checkboxState,
                    onChanged: (stateBool) {
                      setState(() {
                        checkboxState = !checkboxState;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  Text(
                      name,
                      style: TextStyle(fontSize: 30),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            Icon(Icons.all_inclusive)
          ],
        ),
      ),
    );
  }
}
