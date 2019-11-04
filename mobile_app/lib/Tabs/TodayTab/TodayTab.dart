import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Locals/locals.dart';
import '../../Task/Task.dart';
import './TodayTitle.dart';

class TodayTab extends StatelessWidget {
  dynamic tasks;
  TodayTab(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locals.today),
        elevation: 10,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.star_half),
          );
        }),
      ),
      body: ListView(
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
