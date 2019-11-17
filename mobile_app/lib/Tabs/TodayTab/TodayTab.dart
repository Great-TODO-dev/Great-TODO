import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import '../../Models/Task.dart';
import '../../Task/TaskLabel.dart';
import '../../Task/AddTaskCard.dart';
import './TodayTitle.dart';

class TodayTab extends StatefulWidget {
  final List<Task> tasks;
  TodayTab(this.tasks);

  @override
  _TodayTabState createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  void _submitNewTask(Task task){
    setState(() {
      widget.tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: true,
        trailing: CupertinoButton(
          onPressed: () {},
          child: Icon(Icons.add, size: 25,),
        ),
        backgroundColor: Colors.black45,
      ),
      child: ListView(
        children: [
          TodayTitle(),
          ...(widget.tasks as List<Task>).map((task) => TaskLabel(task)).toList(),
          AddTaskCard(_submitNewTask)
        ],
      ),
    );
  }
}
