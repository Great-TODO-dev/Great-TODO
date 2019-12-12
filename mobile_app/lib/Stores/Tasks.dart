import 'package:flutter/cupertino.dart';

import './Task.dart';

import '../Locals/locals.dart';
import '../Utils/DateUtils.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task('Listen', 'not now'),
    Task('Kill bi', 'not now'),
    Task('Interpolate string', 'not now'),
  ];
  Tasks() {
    _forEachId();
  }

  List<String> get allTags{
    List<String> buffer = [];
    _tasks.forEach((task) {
      task.tags.forEach((tag) {
        if (!buffer.contains(tag)) {
          buffer.add(tag);
        }
      });
    });
    return buffer;
  }

  List<Task> get todayTasks{
    return _tasks.where((task) {
      if (task.date == null && task.deadline == null) {
        return true;
      }
      if (DateUtils.isToday(task.date) || DateUtils.isToday(task.deadline)) {
        return true;
      }
      return false;
    }).toList();
  }

  void _forEachId() {
    _tasks.forEach((task) {
      int id = _tasks.length == 0 ? 0 : _tasks.length;
      task.setId(id);
    });
  }

  void removeSingleTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  addTask(Task task) {
    task.setId(_tasks.length);
    _tasks.add(task);
  }
}
