import 'package:flutter/material.dart';
import './HomePage/section.dart';
import './Locals/locals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final NAME = 'Name doesn`t matter';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Hi");
          },
          child: Icon(
            Icons.add,
            size: 30,
            ),
        ),
        appBar: AppBar(
          title: Text(NAME),
        ),
        body: ListView(
          children: [
            Section(Locals.today, '3'),
            Section(Locals.upComing),
            Section(Locals.anyTime),
            Section(Locals.someTime)

          ],
        ),
      ),
    );
  }
}
