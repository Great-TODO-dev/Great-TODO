import 'package:flutter/material.dart';
import './TodayTab/TodayTab.dart';
import './HomePage/HomePage.dart';
import './Stores/MainStore.dart';

void main() {
  MainStore mainStore = MainStore();
  runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/todayTab' : (context) => TodayTab(mainStore.updateTasks())
      },
    ));
}
