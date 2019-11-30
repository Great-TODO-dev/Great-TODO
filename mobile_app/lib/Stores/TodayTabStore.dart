import 'package:flutter/cupertino.dart';

import './Task.dart';

class TodayTabStore with ChangeNotifier {
  List<Task> _tasks;
  List<String> _tags;

  TodayTabStore(this._tasks, this._tags);
}
