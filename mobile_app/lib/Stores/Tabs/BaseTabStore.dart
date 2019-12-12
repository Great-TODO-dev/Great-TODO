import 'package:flutter/material.dart';

import '../../Locals/locals.dart';
import '../Task.dart';

abstract class BaseTabStore with ChangeNotifier{
  String _selectedTag;
  List<Task> _tasks;

  BaseTabStore([this._tasks, this._selectedTag]) {
    _selectedTag = Locals.commonTag;
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

  String get selectedTag {
    return _selectedTag;
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
}
