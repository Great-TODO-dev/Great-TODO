import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//TODO : переделать в StateFullWidget
class Task extends StatelessWidget {
  final String name;
  Task(this.name);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (stateBool) {
            print('Curr state switch - ' + stateBool.toString());
          },
          activeColor: Colors.blue,
          checkColor: Colors.red,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 30),
          )
      ],
    );
  }
}
