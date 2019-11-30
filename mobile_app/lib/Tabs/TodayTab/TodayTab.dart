import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Task/TaskLabel.dart';
import './TodayTitle.dart';
import '../../widgets/TagsList.dart';

import '../../Stores/Tasks.dart';

class TodayTab extends StatefulWidget {
  @override
  _TodayTabState createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  Function _resetSelectedTag;

  _TodayTabState(){
    _resetSelectedTag = null;
  }

  @override
  void didChangeDependencies() {
    if (_resetSelectedTag == null) {
      _resetSelectedTag = Provider.of<Tasks>(context, listen: false).resetSelectedTag;
    }
    super.didChangeDependencies();
  }

  void _moveToAddNewTaskPage() {
      Navigator.of(context).pushNamed('/task');
  }

  @override
  void dispose() {
    print('disposed');
    _resetSelectedTag();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context).tasks;
    print(tasks.length);
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black45,
        transitionBetweenRoutes: true,
        trailing: CupertinoButton(
          onPressed: _moveToAddNewTaskPage,
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: tasks.length + 2,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return TodayTitle();
          }
          if (index == 1) {
            return Column(
              children: [
                TagList(),
                SizedBox(
                  height: 20,
                )
              ],
            );
          }
          return tasks.length != 0 ? ChangeNotifierProvider.value(
            value: tasks[index - 2],
            child: TaskLabel(),
          ) : Container();
        },
      ),
    );
  }
}
