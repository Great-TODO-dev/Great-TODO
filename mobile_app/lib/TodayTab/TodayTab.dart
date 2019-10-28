import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Locals/locals.dart';
import '../Task/Task.dart';

class TodayTab extends StatelessWidget {
  dynamic tasks;
  TodayTab(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Locals.today),
        ),
      body: ListView(
        children: [
          ...(tasks as List<dynamic>).map((task) {
            return Task(task['name'], task['completed']);
          }).toList()
        ],
      ),
    );
  }
}
