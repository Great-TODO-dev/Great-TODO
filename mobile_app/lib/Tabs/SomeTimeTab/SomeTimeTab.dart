import 'package:flutter/material.dart';

import './SomeTimeTitle.dart';

import '../../Stores/Tasks.dart';
import '../../Stores/Task.dart';

import '../BaseTab.dart';



class SomeTimeTab extends BaseTab{
  static final routeName = '/someTimeTab';

  @override
  BaseTabState createState() => _SomeTimeTabState();
}

class _SomeTimeTabState extends BaseTabState {
  @override
  Widget title() {
    return SomeTimeTitle();
  }

  @override
  List<Task> tasksProxy(Tasks tasks) {
    return tasks.someTimeTasks;
  }
}
