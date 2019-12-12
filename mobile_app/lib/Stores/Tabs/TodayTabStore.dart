import 'package:flutter/cupertino.dart';

import '../Task.dart';
import './BaseTabStore.dart';

class TodayTabStore extends BaseTabStore {
  TodayTabStore([tasks, selectedTag]): super(tasks, selectedTag);

  DateTime get today{
    return DateTime.now();
  }
}
