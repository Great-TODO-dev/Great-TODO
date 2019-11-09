import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

import '../../Locals/locals.dart';
import '../../Task/Task.dart';
import './TodayTitle.dart';

class TodayTab extends StatelessWidget {
  dynamic tasks;
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
          ...(tasks as List<dynamic>).map((task) {
            return Task(task['name'], task['completed']);
          }).toList()
        ],
      ),
    );
  }
}
