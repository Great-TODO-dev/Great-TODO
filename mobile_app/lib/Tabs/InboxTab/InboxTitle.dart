import 'package:flutter/material.dart';

import '../../Locals/locals.dart';

class InboxTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 30, bottom: 30),
        child: Flex(
          direction: Axis.horizontal,
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
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    Locals.inbox,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
