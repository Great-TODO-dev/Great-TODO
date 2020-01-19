import 'package:flutter/material.dart';

import '../Locals/locals.dart';

class Placehodler extends StatelessWidget {
  const Placehodler();

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      child: SizedBox(
        height: deviceSize.height / 1.5,
        child: Center(
          child: Text(
            Locals.noTasks,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
