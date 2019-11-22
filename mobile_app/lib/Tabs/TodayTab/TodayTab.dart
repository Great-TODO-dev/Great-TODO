import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import '../../Models/Task.dart';
import '../../Task/TaskLabel.dart';
import './TodayTitle.dart';


class TodayTab extends StatefulWidget {
  bool needToShowAddDialog = false;
  final List<Task> tasks;
  TodayTab(this.tasks);

  @override
  _TodayTabState createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab>{

  @override
  void initState() {
    super.initState();
  }

  void _submitNewTask(Task task){
    setState(() {
      widget.needToShowAddDialog = false;
      widget.tasks.add(task);
    });
  }

  void moveToAddNewTaskPage(){
    Navigator.of(context).pushNamed('/task', arguments: _submitNewTask);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.needToShowAddDialog);
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: true,
        trailing: CupertinoButton(
          onPressed: () => moveToAddNewTaskPage(),
          child: Icon(Icons.add, size: 25,),
        ),
        backgroundColor: Colors.black45,
      ),
      child: ListView(
        children: [
          TodayTitle(),
          ...(widget.tasks as List<Task>).map((task) => TaskLabel(task)).toList()
        ],
      ),
    );
  }
}
