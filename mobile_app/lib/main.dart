import 'package:flutter/material.dart';
import './Tabs/TodayTab/TodayTab.dart';
import './HomePage/HomePage.dart';
import './Stores/MainStore.dart';

void main() {
  MainStore mainStore = MainStore();
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(elevation: 0)
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/todayTab' : (context) => TodayTab(mainStore.updateTasks())
      },
    ));
}
