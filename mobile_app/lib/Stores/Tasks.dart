import 'package:flutter/cupertino.dart';

import './Task.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task('Listen', 'not now'),
    Task('Kill bi', 'not now'),
    Task('Interpolate string', 'not now'),
  ];

  List<Task> get tasks {
    return [..._tasks];
  }

  int get countOfTasks {
    return _tasks.length;
  }
}
