import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './UpcomingTitle.dart';
import '../../widgets/common/TagsList.dart';
import '../../Task/TaskLabel.dart';
import './TasksSection.dart';

import '../../Stores/Tasks.dart';
import '../../Stores/Task.dart';

class Upcoming extends StatefulWidget {
  static const routeName = "/upcoming";

  Upcoming();

  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context).tasksForDays;
    print(tasks);
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black45,
        transitionBetweenRoutes: true,
      ),
      child: ListView.builder(
        itemCount: tasks.length + 2,
        // itemCount: 3,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return UpcomingTitle();
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
          return TasksSection(tasks.keys.toList()[index - 2], tasks[tasks.keys.toList()[index - 2]]);
        },
      ),
    );
  }
}
