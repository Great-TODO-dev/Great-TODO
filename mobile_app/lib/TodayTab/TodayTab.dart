import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Locals/locals.dart';
import '../Task/Task.dart';

class TodayTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Locals.today),
        ),
      body: ListView(
        children: [
          Task('Kill all bastards')
        ],
      ),
    );
  }
}
