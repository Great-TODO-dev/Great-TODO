import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './Stores/Tasks.dart';
import './Stores/Tabs/BaseTabStore.dart';
import './Stores/Tabs/TodayTabStore.dart';

import './Tabs/TodayTab/TodayTab.dart';
import './HomePage/HomePage.dart';
import './Task/AddTaskPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var test = TodayTabStore();

    print(test is BaseTabStore);


    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Tasks(),
        ),
        ChangeNotifierProxyProvider<Tasks, TodayTabStore>(
          builder: (ctx, tasks, prevTodayTabStore) => prevTodayTabStore == null ?  TodayTabStore() : TodayTabStore(tasks.todayTasks, prevTodayTabStore.selectedTag),
        )
      ],
      child: CupertinoApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en'),
        ],
        color: Colors.grey,
        theme: MaterialBasedCupertinoThemeData(
            materialTheme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: Colors.white,
          accentColor: Color.fromRGBO(47, 47, 47, 1),
        )),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/todayTab': (context) => TodayTab(),
          '/task': (context) => TaskPage()
        },
      ),
    );
  }
}
