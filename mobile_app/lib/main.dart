import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './Tabs/TodayTab/TodayTab.dart';
import './HomePage/HomePage.dart';
import './Stores/MainStore.dart';
import './Task/AddTaskPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final MainStore mainStore = MainStore();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
    color: Colors.grey,
    theme: MaterialBasedCupertinoThemeData(
        materialTheme:
            ThemeData(fontFamily: 'Montserrat', primaryColor: Colors.white, accentColor: Color.fromRGBO(47, 47, 47, 1))),
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/todayTab': (context) => TodayTab(mainStore.tasks),
      '/task' : (context) => TaskPage()
    },
  );
  }
}
