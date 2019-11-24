import 'Task.dart';

class MainStore {
  final List<Task> _tasks = [];
  MainStore() {
    _tasks.add(generateRandomTask());
    _tasks.add(generateRandomTask());
  }

  Task generateRandomTask() {
    final Task task = new Task('Valid');
    return task;
  }

  List<Task> get tasks {
    return _tasks;
  }
}
