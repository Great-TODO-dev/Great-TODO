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

  int _selectedTagId;

  Tasks([this._selectedTagId = 0]) {
    _forEachId();
  }

  List<Task> get tasks {
    return [
      ..._tasks
          .where((task) => task.tags.contains(_tags[_selectedTagId]))
          .toList()
          .reversed
    ];
  }

  List<String> get tags {
    return [..._tags];
  }

  void setSelectedTagId(int id) {
    if (id == _selectedTagId) {
      _selectedTagId = 0;
    } else {
      _selectedTagId = id;
    }
    notifyListeners();
  }

  void resetSelectedTag() {
    _selectedTagId = 0;
  }

  int get selectedTagId {
    return _selectedTagId;
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
