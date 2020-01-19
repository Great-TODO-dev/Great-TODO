import 'package:flutter/material.dart';

import './TodayTitle.dart';

import '../../Stores/Tasks.dart';
import '../../Stores/Task.dart';

import '../BaseTab.dart';

class TodayTab extends BaseTab {
  static final routeName = '/todayTab';

  @override
  BaseTabState createState() => _TodayTabState();

}

class _TodayTabState extends BaseTabState {
  @override
  Widget title() {
    return TodayTitle();
  }

  @override
  List<Task> tasksProxy(Tasks tasks) {
    return tasks.todayTasks;
  }
}
