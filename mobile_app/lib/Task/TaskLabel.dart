import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import './TaskFullView.dart';
import '../Stores/Task.dart';

class TaskLabel extends StatefulWidget {
  final Task task;
  TaskLabel(this.task);

  @override
  State<StatefulWidget> createState() {
    return _TaskLabelState(task);
  }
}

class _TaskLabelState extends State<TaskLabel> {
  final Task task;
  _TaskLabelState(this.task);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.only(right: 15),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CupertinoSwitch(
                    value: task.doneState,
                    onChanged: (stateBool) {
                      setState(() {
                        task.doneState = !task.doneState;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  Text(
                    task.name,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
            Icon(Icons.all_inclusive, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
