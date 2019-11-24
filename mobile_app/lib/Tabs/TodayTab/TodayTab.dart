import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Stores/Task.dart';
import '../../Task/TaskLabel.dart';
import './TodayTitle.dart';

import '../../Stores/Tasks.dart';

class TodayTabDeprecated extends StatefulWidget {
  bool needToShowAddDialog = false;
  final List<Task> tasks;
  TodayTabDeprecated(this.tasks);

  @override
  _TodayTabDeprecatedState createState() => _TodayTabDeprecatedState();
}

class _TodayTabDeprecatedState extends State<TodayTabDeprecated> {
  @override
  void initState() {
    super.initState();
  }

  void _submitNewTask(Task task) {
    setState(() {
      widget.needToShowAddDialog = false;
      widget.tasks.add(task);
    });
  }

  void moveToAddNewTaskPage() {
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
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
        backgroundColor: Colors.black45,
      ),
      child: ListView(
        children: [
          TodayTitle(),
          ...(widget.tasks as List<Task>)
              .map((task) => TaskLabel(task))
              .toList()
        ],
      ),
    );
  }
}

class TodayTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context);
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black45,
        transitionBetweenRoutes: true,
        trailing: CupertinoButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: tasks.countOfTasks + 1,
        itemBuilder: (ctx, index) => index == 0 ? TodayTitle() : TaskLabel(tasks.tasks[index - 1]),
      ),
    );
  }
}
