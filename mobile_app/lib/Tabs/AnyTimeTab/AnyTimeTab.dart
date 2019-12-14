import 'package:flutter/material.dart';

import './AnyTimeTitle.dart';

import '../../Stores/Tasks.dart';
import '../../Stores/Task.dart';

import '../BaseTab.dart';



class AnyTimeTab extends BaseTab{
  static final routeName = '/anyTimeTab';

  @override
  Widget title() {
    return AnyTimeTitle();
  }

  @override
  List<Task> tasksProxy(Tasks tasks) {
    return tasks.inboxTasks;
  }
}
