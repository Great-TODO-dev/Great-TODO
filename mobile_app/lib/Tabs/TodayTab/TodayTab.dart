import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Task/TaskLabel.dart';
import './TodayTitle.dart';

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
        itemCount: tasks.countOfTasks + 1,
        itemBuilder: (ctx, index) => index == 0
            ? TodayTitle()
            : ChangeNotifierProvider.value(
                value: tasks.tasks[index - 1],
                child: TaskLabel()),
      ),
    );
  }
}
