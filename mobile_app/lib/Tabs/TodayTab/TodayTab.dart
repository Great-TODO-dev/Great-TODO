import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Task/TaskLabel.dart';
import './TodayTitle.dart';
import '../../widgets/TagsList.dart';

import '../../Stores/Tasks.dart';

class TodayTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void moveToAddNewTaskPage() {
      Navigator.of(context).pushNamed('/task');
    }

    final tasks = Provider.of<Tasks>(context);
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black45,
        transitionBetweenRoutes: true,
        trailing: CupertinoButton(
          onPressed: moveToAddNewTaskPage,
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: tasks.countOfTasks + 2,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return TodayTitle();
          }
          if (index == 1) {
            return Column(
              children: [
                TagList(),
                SizedBox(height: 20,)
              ],
            );
          }
          return ChangeNotifierProvider.value(
              value: tasks.tasks[index - 2], child: TaskLabel());
        },
      ),
    );
  }
}
