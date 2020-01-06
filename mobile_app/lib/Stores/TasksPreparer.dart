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

  Map<int, List<Task>> sortTasksForDays(List<Task> tasks){
    Map<int, List<Task>> result = {};
    tasks.forEach((task) {
      if (task.date != null) {
        result.containsKey(task.date.day) ? result[task.date.day] += [task] : result[task.date.day] = [task];
      }
      if (task.deadline != null) {
        result.containsKey(task.deadline.day) ? result[task.deadline.day] += [task] : result[task.deadline.day] = [task];
      }
    });
    return result;
  }
}
