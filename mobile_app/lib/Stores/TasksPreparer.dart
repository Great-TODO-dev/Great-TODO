import 'package:intl/intl.dart';

import './Task.dart';
import '../Locals/locals.dart';

mixin TasksPreparer {
  List<Task> tagProxy(List<Task> tasks, String selectedTag){
    if (selectedTag == Locals.commonTag) {
      return [...tasks];
    }
    return [
      ...tasks
          .where((task) => task.tags.contains(selectedTag))
          .toList()
    ];
  }

  List<Task> getTasksForAnyTime(List<Task> tasks){
    return tasks.reversed.where((task) => task.store == Store.AnyTime).toList();
  }

  Map<DateTime, List<Task>> sortTasksForDays(List<Task> tasks){
    DateFormat format = DateFormat("yyyy mm dd");
    Map<DateTime, List<Task>> result = {};

    tasks.forEach((task) {
      if (task.date != null) {
        final formatDate = format.parse("${task.date.year} ${task.date.month} ${task.date.day}");
        print(formatDate);
        result.containsKey(formatDate) ? result[formatDate] += [task] : result[formatDate] = [task];
      }
      if (task.deadline != null) {
        final formatDate = format.parse("${task.deadline.year} ${task.deadline.month} ${task.deadline.day}");
        result.containsKey(formatDate) ? result[formatDate] += [task] : result[formatDate] = [task];
      }
    });
    return result;
  }
}
