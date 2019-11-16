import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import '../../Models/Task.dart';
import '../../Task/TaskLabel.dart';
import './TodayTitle.dart';

class TodayTab extends StatelessWidget {
  List<Task> tasks;
  TodayTab(this.tasks);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: true,
        trailing: Text('data'),
        backgroundColor: Colors.black45,
      ),
      child: ListView(
        children: [
          TodayTitle(),
          ...(tasks as List<Task>).map((task) => TaskLabel(task)).toList()
        ],
      ),
    );
  }
}
