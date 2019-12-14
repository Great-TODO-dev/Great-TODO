import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Stores/Tasks.dart';
import '../Stores/Task.dart';
import '../widgets/common/TagsList.dart';
import '../Task/TaskLabel.dart';

abstract class BaseTab extends StatelessWidget {
  void _moveToAddNewTaskPage(BuildContext context) {
    Navigator.of(context).pushNamed('/task');
  }

  Widget title() {}

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
        itemCount: tasks.length + 2,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return title();
          }
          if (index == 1) {
            return Column(
              children: [
                TagList(),
                SizedBox(
                  height: 20,
                )
              ],
            );
          }
          return tasks.length != 0
              ? ChangeNotifierProvider.value(
                  value: tasks[index - 2],
                  child: TaskLabel(),
                )
              : Container();
        },
      ),
    );
  }
}
