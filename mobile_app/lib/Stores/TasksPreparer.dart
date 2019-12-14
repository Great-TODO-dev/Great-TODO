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
}
