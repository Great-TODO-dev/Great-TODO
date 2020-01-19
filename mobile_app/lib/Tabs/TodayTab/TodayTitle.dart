import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Locals/locals.dart';

class TodayTitle extends StatelessWidget {
  TodayTitle();

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
                  Icons.star,
                  color: Colors.yellow,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    Locals.today,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
