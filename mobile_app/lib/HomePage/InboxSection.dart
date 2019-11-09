import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InboxSection extends StatefulWidget {
  final String sectionName;
  int count;
  InboxSection(this.sectionName, this.count);

  @override
  State<StatefulWidget> createState() {
    return _InboxSectionState(sectionName, count);
  }
}

class _InboxSectionState extends State<InboxSection> {
  final String sectionName;
  int count;
  _InboxSectionState(this.sectionName, this.count);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.pushNamed(context, '/todayTab');
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.inbox,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      sectionName,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Text(
              count.toString(),
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
