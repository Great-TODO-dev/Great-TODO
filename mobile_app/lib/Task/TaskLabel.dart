import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Stores/Task.dart';

import './EditTaskPage.dart';
import '../widgets/Checkbox.dart' as wg;

class TaskLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Navigator.of(context)
            .pushNamed(EditTaskPage.routeName, arguments: task);
      },
      child: Container(
        padding: EdgeInsets.only(right: 15),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  wg.Checkbox(
                    checked: task.doneState,
                    onChanged: (_) {
                      task.changeDoneState();
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    task.name,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.all_inclusive,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
