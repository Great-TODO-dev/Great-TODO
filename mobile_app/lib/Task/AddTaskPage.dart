import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Locals/locals.dart';
import '../Stores/Task.dart';
import '../Stores/Tasks.dart';

import '../widgets/TagListTask.dart';

class TaskPage extends StatefulWidget {
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();
  Task _task;

  _TaskPageState();

  void _validateTask() {
    if (_task.id == null) {
      String name = taskName.text;
      String description = taskDescription.text;
      Task task = new Task(name, description);
      Provider.of<Tasks>(context, listen: false).addTask(task);
      Navigator.pop(context);
      return;
    }

    _task.name = taskName.text;
    _task.description = taskDescription.text;
    Navigator.pop(context);
  }

  void _removeTask() {
    Provider.of<Tasks>(context, listen: false).removeSingleTask(_task.id);
    Navigator.pop(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _task = ModalRoute.of(context).settings?.arguments == null
        ? new Task()
        : ModalRoute.of(context).settings.arguments as Task;
    if (_task.id != null) {
      taskName.text = _task.name;
      taskDescription.text = _task.description;
    }
  }

  @override
  void dispose() {
    taskName.dispose();
    taskDescription.dispose();
    super.dispose();
  }

  bool get _needToShowCompleteButton {
    return taskName.text != '' || taskDescription.text != '';
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
          value: _task,
          child: Scaffold(
          backgroundColor: Colors.black,
          floatingActionButton: _needToShowCompleteButton
              ? FloatingActionButton(
                  onPressed: () => _validateTask(),
                  child: Icon(
                    Icons.done,
                    size: 40,
                  ),
                )
              : Container(),
          appBar: CupertinoNavigationBar(
            transitionBetweenRoutes: true,
            trailing: _task.id != null
                ? CupertinoButton(
                    onPressed: () => _removeTask(),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  )
                : Container(),
            backgroundColor: Colors.black45,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: taskName,
                  showCursor: true,
                  style: TextStyle(color: Colors.white, fontSize: 28),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Locals.name,
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(230, 230, 230, 0.7)),
                  ),
                ),
                SizedBox(height: 20),
                TagListTask(),
                SizedBox(height: 20),
                TextField(
                  onChanged: (_) {
                    setState(() {});
                  },
                  maxLines: null,
                  controller: taskDescription,
                  showCursor: true,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: Locals.description,
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(230, 230, 230, 0.7)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
