import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Locals/locals.dart';
import '../Models/Task.dart';

class TaskPage extends StatefulWidget {
  TaskPage() {
    print("Rebuild State");
  }

  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();
  Function _submitNewTask;

  _TaskPageState();

  _validateTask() {
    String name = taskName.text;
    String description = taskDescription.text;
    Task task = new Task(name, description);
    _submitNewTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    _submitNewTask = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _validateTask(),
          child: Icon(
            Icons.done,
            size: 40,
          ),
        ),
        appBar: CupertinoNavigationBar(
          transitionBetweenRoutes: true,
          trailing: CupertinoButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              size: 25,
            ),
          ),
          backgroundColor: Colors.black45,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: taskName,
                showCursor: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: Locals.name,
                  hintStyle: TextStyle(color: Color.fromRGBO(230, 230, 230, 0.7)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: null,
                controller: taskDescription,
                showCursor: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: Locals.description,
                  hintStyle: TextStyle(color: Color.fromRGBO(230, 230, 230, 0.7)),
                ),
              )
            ],
          ),
        ));
  }
}
