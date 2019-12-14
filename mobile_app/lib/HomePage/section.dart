import 'package:flutter/material.dart';

import '../Locals/locals.dart';

import '../Tabs/InboxTab/InboxTab.dart';
import '../Tabs/TodayTab/TodayTab.dart';
import '../Tabs/SomeTimeTab/SomeTimeTab.dart';
import '../Tabs/AnyTimeTab/AnyTimeTab.dart';

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
          case Locals.today:
            Navigator.pushNamed(context, TodayTab.routeName);
            break;
          case Locals.anyTime:
            Navigator.pushNamed(context, AnyTimeTab.routeName);
            break;
          case Locals.someTime:
            Navigator.pushNamed(context, SomeTimeTab.routeName);
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
                    style: TextStyle(fontSize: 30, color: Colors.white),
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
