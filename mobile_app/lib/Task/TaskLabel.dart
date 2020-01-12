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
      padding: EdgeInsets.only(right: 15),
      onPressed: () {
        Navigator.of(context)
            .pushNamed(EditTaskPage.routeName, arguments: task);
      },
      child: SizedBox(
        width: double.infinity,
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            print(constraints.maxWidth);
            return Row(
              children: [
                Row(
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
                      Container(
                        constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.8, minWidth: constraints.maxWidth * 0.8),
                        child: Text(
                          task.name,
                          style: TextStyle(
                              fontSize: 30,
                              color: task.doneState
                                  ? Color.fromRGBO(102, 102, 102, 1)
                                  : Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                Icon(
                  Icons.all_inclusive,
                  color: Colors.white,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
