import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Tabs/TodayTab/TodayTab.dart';
import './HomePage/HomePage.dart';
import './Stores/MainStore.dart';

void main() {
  MainStore mainStore = MainStore();
  runApp(CupertinoApp(
    color: Colors.grey,
    theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(brightness: Brightness.dark)),
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/todayTab': (context) => TodayTab(mainStore.updateTasks()),
    },
  ));
}
