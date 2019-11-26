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
      task.generateId();
    });
  }

  void removeSingleTask(int id){
    // _tasks.removeWhere(test);
    notifyListeners();
  }

  addTask(Task task){
    task.generateId();
    _tasks.add(task);
  }

  int get countOfTasks {
    return _tasks.length;
  }
}
