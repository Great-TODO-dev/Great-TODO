import 'package:flutter/cupertino.dart';

import './Task.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task('Listen', 'not now'),
    Task('Kill bi', 'not now'),
    Task('Interpolate string', 'not now'),
  ];

  List<String> _tags = [
    'All',
    'hard',
    'fast',
    'define',
    'decompose',
    'listview'
  ];

  String _selectedTag;

  Tasks([this._selectedTag = 'All']) {
    _forEachId();
  }

  List<Task> get tasks {
    return [
      ..._tasks
          .where((task) => task.tags.contains(_selectedTag))
          .toList()
          .reversed
    ];
  }

  List<String> get tags {
    List<String> buffer = ['All'];
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
      _selectedTag = 'All';
    } else {
      _selectedTag = tag;
    }
    notifyListeners();
  }

  void resetSelectedTag() {
    _selectedTag = 'All';
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
    notifyListeners();
  }

  addTask(Task task) {
    task.setId(_tasks.length);
    _tasks.add(task);
  }
}
