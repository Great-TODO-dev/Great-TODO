import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './UpcomingTitle.dart';
import '../../widgets/common/TagsList.dart';
import '../../Task/TaskLabel.dart';
import './TasksSection.dart';
import '../Placeholder.dart';

import '../../Stores/Tasks.dart';

class Upcoming extends StatefulWidget {
  static const routeName = "/upcoming";

  Upcoming();

  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {

  final _countWidgetsWithoutTasks = 2;

  List<DateTime> _sortDates(List<DateTime> dates) {
    dates.sort((a, b) => a.compareTo(b));
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context).tasksForDays;
    List<DateTime> dates = _sortDates(tasks.keys.toList());
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black45,
        transitionBetweenRoutes: true,
      ),
      child: ListView.builder(
        itemCount: tasks.length == 0 ? _countWidgetsWithoutTasks : tasks.length + 2,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return UpcomingTitle();
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
          return TasksSection(dates[index - 2], tasks[dates[index - 2]]);
        },
      ),
    );
  }
}
