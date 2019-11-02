import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String name;
  final String count;
  final Icon _icon;
  Section(this.name, this._icon, [this.count = '']);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (name) {
          case 'Today':
            Navigator.pushNamed(context, '/todayTab');
            break;
          default:
        }
      },
      child: Container(
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                _icon,
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
