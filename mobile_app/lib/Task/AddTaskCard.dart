import 'package:Great_TODO/Models/Task.dart';
import 'package:flutter/material.dart';

import '../Locals/locals.dart';

class AddTaskCard extends StatefulWidget {
  final Function submitTask;
  AddTaskCard(this.submitTask);


  _AddTaskCardState createState() => _AddTaskCardState();
}

class _AddTaskCardState extends State<AddTaskCard> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();

  void validateAndSubmitTask() {
    print(taskName.text);
    print(taskDescription.text);
    widget.submitTask(Task(taskName.text, taskDescription.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Color.fromRGBO(47, 47, 47, 1),
      margin: EdgeInsets.all(15),
      child: Padding(
          padding: EdgeInsets.all(10),
              child: Column(
          children: [
            TextField(
              controller: taskName,
              showCursor: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: Locals.name,
                hintStyle: TextStyle(color: Color.fromRGBO(230, 230, 230, 0.7)),
                border: InputBorder.none),
            ),
            TextFormField(
              controller: taskDescription,
              onFieldSubmitted: (str) {
                print("Submitted $str");
              },
              showCursor: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: Locals.description,
                hintStyle: TextStyle(color: Color.fromRGBO(230, 230, 230, 0.7)),
                border: InputBorder.none),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              IconButton(icon: Icon(Icons.add), iconSize: 30, onPressed: () => validateAndSubmitTask(),)
            ],)
          ],
        ),
      ),
    );
  }
}
