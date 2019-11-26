import 'package:flutter/cupertino.dart';

import './Task.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task('Listen', 'not now'),
    Task('Kill bi', 'not now'),
    Task('Interpolate string', 'not now'),
  ];

  Tasks(){
    _forEachId();
  }

  List<Task> get tasks {
    return [..._tasks.reversed];
  }

  void _forEachId() {
    _tasks.forEach((task) {
      int id = _tasks.length == 0 ? 0 : _tasks.length;
      task.setId(id);
    });
  }

  void removeSingleTask(int id){
    // _tasks.removeWhere(test);
    notifyListeners();
  }

  addTask(Task task){
    task.setId(_tasks.length);
    _tasks.add(task);
  }

  int get countOfTasks {
    return _tasks.length;
  }
}
