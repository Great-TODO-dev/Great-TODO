import 'package:flutter/material.dart';

import '../../Locals/locals.dart';

class UpcomingTitle extends StatelessWidget {
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
                  Icons.today,
                  color: Colors.purple,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    Locals.upComing,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
