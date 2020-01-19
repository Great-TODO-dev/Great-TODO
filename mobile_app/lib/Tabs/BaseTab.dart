import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Stores/Tasks.dart';
import '../Stores/Task.dart';
import '../widgets/common/TagsList.dart';
import '../Task/TaskLabel.dart';
import '../Task/AddTaskPage.dart';
import './Placeholder.dart';

abstract class BaseTab extends StatefulWidget {

  @override
  BaseTabState createState();
}

abstract class BaseTabState extends State<BaseTab> {
  final _countWidgetsWithoutTasks = 2;

  void _moveToAddNewTaskPage(BuildContext context) {
    Navigator.of(context).pushNamed(AddTaskPage.routeName);
  }

  Widget title() {}

  @override
  void deactivate() {
    Provider.of<Tasks>(context).resetSelectedTag();
    super.deactivate();
  }

  List<Task> tasksProxy(Tasks tasks) {}

  @override
  Widget build(BuildContext context) {
    final tasks = tasksProxy(Provider.of<Tasks>(context));
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black45,
        transitionBetweenRoutes: true,
        trailing: CupertinoButton(
          onPressed: () => _moveToAddNewTaskPage(context),
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: tasks.length == 0 ? _countWidgetsWithoutTasks : tasks.length + 2,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return title();
          }
          if (index == 1) {
            if (tasks.length == 0) {
              return Placehodler();
            }
            return Column(
              children: [
                TagList(),
                SizedBox(
                  height: 20,
                )
              ],
            );
          }
          return ChangeNotifierProvider.value(
                  value: tasks[index - 2],
                  child: TaskLabel(),
                );
        },
      ),
    );
  }
}
