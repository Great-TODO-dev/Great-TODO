import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Stores/Task.dart';

import './EditTaskPage.dart';

class TaskLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pushNamed(EditTaskPage.routeName, arguments: task);
      },
      child: Container(
        padding: EdgeInsets.only(right: 15),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Material(
                    color: Colors.black,
                    child: Container(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Checkbox(
                          value: task.doneState,
                          onChanged: (_) {
                            task.changeDoneState();
                          },
                          activeColor: Colors.blue,
                        ),
                      ),
                    ),
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
