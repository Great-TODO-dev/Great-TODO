import 'dart:convert';

import 'package:flutter/cupertino.dart';

import './Task.dart';
import './TasksPreparer.dart';
import '../Repository/Repository.dart';

import '../Locals/locals.dart';
import '../Utils/DateUtils.dart';

class Tasks with ChangeNotifier, TasksPreparer, Repository {
  List<Task> _tasks = [
    // Task(id: 250, name: 'Listen', description: 'not now'),
    // Task(id: 251, name: 'Kill bi', description: 'not now'),
    // Task(id: 252, name: 'Interpolate string', description: 'not now'),
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
    Repository.insertTask(task);
    notifyListeners();
  }

  Future<void> updateTasks() async {
    final tasks = await Repository.getTasks();
    try {
      _tasks.addAll(tasks
        .map((item) => Task(
              id: item['id'],
              name: item['name'],
              tags: json.decode(item['tags']).cast<String>(),
              description: item['description'],
              date: item['date'] == 'null' ? null :  DateTime.parse(item['date']),
              deadLine: item['deadline'] == 'null' ? null : DateTime.parse(item['deadline']),
              store: Task.parseStore(item['store'])
            )).toList()
        );
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateTask(int id) async{
    await Repository.updateTask(_tasks.firstWhere((task) => task.id == id));
  }

  List<Task> get todayTasks {
    return tagProxy(
        _tasks.reversed.where((task) {
          if (task.date != null || task.deadline != null) {
            if (DateUtils.isToday(task.date) ||
                DateUtils.isToday(task.deadline)) {
              return true;
            }
          }
          return false;
        }).toList(),
        _selectedTag);
  }

  List<Task> get inboxTasks {
    return tagProxy(
        _tasks.reversed
            .where((task) => task.date == null && task.deadline == null)
            .toList(),
        _selectedTag);
  }

  List<Task> get anyTimeTasks {
    return tagProxy(
        _tasks.reversed.where((task) => task.store == Store.AnyTime).toList(),
        _selectedTag);
  }

  List<Task> get someTimeTasks {
    return tagProxy(
        _tasks.reversed.where((task) => task.store == Store.SomeTime).toList(),
        _selectedTag);
  }

  Map<DateTime, List<Task>> get tasksForDays {
    return this.sortTasksForDays(tagProxy(_tasks, _selectedTag));
  }
}
