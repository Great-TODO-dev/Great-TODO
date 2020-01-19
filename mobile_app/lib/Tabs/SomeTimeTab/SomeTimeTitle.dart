import 'package:flutter/material.dart';

import '../../Locals/locals.dart';

class SomeTimeTitle extends StatelessWidget {
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
                  Icons.indeterminate_check_box,
                  color: Colors.brown,
                  size: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    Locals.someTime,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
