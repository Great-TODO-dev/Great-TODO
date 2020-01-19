import 'package:flutter/material.dart';

import './InboxTitle.dart';

import '../../Stores/Tasks.dart';
import '../../Stores/Task.dart';

import '../BaseTab.dart';



class InboxTab extends BaseTab{
  static final routeName = '/inboxTab';

  @override
  BaseTabState createState() => _InboxTabState();
}

class _InboxTabState extends BaseTabState {
  @override
  Widget title() {
    return InboxTitle();
  }

  @override
  List<Task> tasksProxy(Tasks tasks) {
    return tasks.inboxTasks;
  }
}
