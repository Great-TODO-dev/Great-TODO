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

  String _selectedTag;

  Tasks([this._selectedTag]) {
    _forEachId();
    if (_selectedTag == null) {
      _selectedTag = Locals.commonTag;
    }
  }

  List<Task> get tasks {
    if (_selectedTag == Locals.commonTag) {
      return [..._tasks.reversed];
    }
    return [
      ..._tasks
          .where((task) => task.tags.contains(_selectedTag))
          .toList()
          .reversed
    ];
  }

  List<String> get tags {
    List<String> buffer = [Locals.commonTag];
    _tasks.forEach((task) {
      task.tags.forEach((tag) {
        if (!buffer.contains(tag)) {
          buffer.add(tag);
        }
      });
    });
    return buffer;
  }

  List<String> get allTags {
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

  void setSelectedTag(String tag) {
    if (tag == _selectedTag) {
      _selectedTag = Locals.commonTag;
    } else {
      _selectedTag = tag;
    }
    notifyListeners();
  }

  void resetSelectedTag() {
    _selectedTag = Locals.commonTag;
  }

  String get selectedTagId {
    return _selectedTag;
  }

  void _forEachId() {
    _tasks.forEach((task) {
      int id = _tasks.length == 0 ? 0 : _tasks.length;
      task.setId(id);
    });
  }

  void removeSingleTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
    resetSelectedTag();
    notifyListeners();
  }

  addTask(Task task) {
    task.setId(_tasks.length);
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> get todayTasks {
    return _tasks.reversed.where((task) {
      if (task.date != null || task.deadline != null) {
        if (DateUtils.isToday(task.date) || DateUtils.isToday(task.deadline)) {
          return true;
        }
      }
      return false;
    }).toList();
  }

  List<Task> get inboxTasks {
    return _tasks.reversed
        .where((task) => task.date == null && task.deadline == null)
        .toList();
  }
}
