import 'package:flutter/material.dart';

import '../Stores/Task.dart';

class TaskFullView extends StatefulWidget {
  final Task task;
  TaskFullView(this.task);

  _TaskFullViewState createState() => _TaskFullViewState(task);
}

class _TaskFullViewState extends State<TaskFullView> {
  final Task task;
  _TaskFullViewState(this.task);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Hero(
              tag: 'task',
              child: Row(
              children: [
                Checkbox(
                  value: task.doneState,
                  onChanged: (stateBool) {
                    setState(() {
                      task.doneState = !task.doneState;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    task.name,
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
