import 'package:flutter/cupertino.dart';

import './Task.dart';

class TodayTabStore with ChangeNotifier {
  List<Task> _tasks;

  TodayTabStore(this._tasks);

  List<Task> get tasks {

  }
}
