import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String name;
  final String count;
  Section(this.name, [this.count = '']);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped');
      },
      child: Container(
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                Icon(
                  Icons.functions,
                  color: Colors.black87,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            )),
            Text(
              count,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}

// Код для Списка конкретных задач - 4.39.13 / 5.44.31
// ...(tasks as List<String>).map((task) {
//    return Task(task)
// }).toList();
