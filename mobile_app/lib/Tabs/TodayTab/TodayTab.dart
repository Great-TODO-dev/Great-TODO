import 'package:flutter/material.dart';

import './TodayTitle.dart';

import '../../Stores/Tasks.dart';
import '../../Stores/Task.dart';

import '../BaseTab.dart';

class TodayTab extends BaseTab {
  @override
  Widget title() {
    return TodayTitle();
  }

  @override
  List<Task> tasksProxy(Tasks tasks) {
    return tasks.todayTasks;
  }
}
