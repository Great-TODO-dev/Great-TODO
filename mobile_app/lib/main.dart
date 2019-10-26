import 'package:flutter/material.dart';
import './TodayTab/TodayTab.dart';
import './HomePage/HomePage.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/todayTab' : (context) => TodayTab()
      },
    ));
