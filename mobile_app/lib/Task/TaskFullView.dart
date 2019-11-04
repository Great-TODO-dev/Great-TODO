import 'package:flutter/material.dart';

class TaskFullView extends StatefulWidget {
  String name;
  TaskFullView(this.name);

  _TaskFullViewState createState() => _TaskFullViewState(name);
}

class _TaskFullViewState extends State<TaskFullView> {
  final String name;
  bool checkboxState = true;
  _TaskFullViewState(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Hero(
              tag: 'task',
              child: Row(
              children: [
                Checkbox(
                  value: checkboxState,
                  onChanged: (stateBool) {
                    setState(() {
                      checkboxState = !checkboxState;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new TaskFullView(name)
                    ));
                  },
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
