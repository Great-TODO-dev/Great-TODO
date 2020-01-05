import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Locals/locals.dart';
import '../Stores/Task.dart';
import '../Stores/Tasks.dart';

import '../widgets/TagListTask.dart';
import './DateTimePickers.dart';

class TaskPage extends StatefulWidget {
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();
  Task _task;

  bool _needToShowStoreChange = false;

  _TaskPageState();

  void _validateTask() {
    if (_task.id == null) {
      String name = taskName.text;
      String description = taskDescription.text;
      List<String> tags = _task.tags;
      Task task = new Task(name: name, description: description,tags: tags);
      Provider.of<Tasks>(context, listen: false).addTask(task);
      Navigator.pop(context);
      return;
    }

    _task.name = taskName.text;
    _task.description = taskDescription.text;
    Provider.of<Tasks>(context, listen: false).updateTask(_task.id);
    Navigator.pop(context);
  }

  void _removeTask() {
    Provider.of<Tasks>(context, listen: false).removeSingleTask(_task.id);
    Navigator.pop(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _task = ModalRoute.of(context).settings?.arguments == null
        ? new Task()
        : ModalRoute.of(context).settings.arguments as Task;
    if (_task.id != null) {
      taskName.text = _task.name;
      taskDescription.text = _task.description;
    }
  }

  @override
  void dispose() {
    taskName.dispose();
    taskDescription.dispose();
    super.dispose();
  }

  bool get _needToShowCompleteButton {
    return taskName.text != '' || taskDescription.text != '';
  }

  void _showStorageChoose() => setState(() {
        _needToShowStoreChange = true;
      });

  void _submitStore(Store store){
    if (_task.store == store) {
      store = null;
    }
    _task.store = store;
    _needToShowStoreChange = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider.value(
      value: _task,
      child: Stack(children: [
        Scaffold(
            backgroundColor: Colors.black,
            floatingActionButton: _needToShowCompleteButton
                ? FloatingActionButton(
                    onPressed: () => _validateTask(),
                    child: Icon(
                      Icons.done,
                      size: 40,
                    ),
                  )
                : Container(),
            appBar: CupertinoNavigationBar(
              backgroundColor: Colors.black45,
              transitionBetweenRoutes: true,
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: CupertinoButton(
                      onPressed: () => _showStorageChoose(),
                      child: Icon(
                        Icons.storage,
                        color: Colors.blue,
                        size: 50,
                      ),
                    ),
                  ),
                  if (_task.id != null)
                    FittedBox(
                      child: CupertinoButton(
                        onPressed: () => _removeTask(),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    )
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: taskName,
                    showCursor: true,
                    style: TextStyle(color: Colors.white, fontSize: 28),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Locals.name,
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(230, 230, 230, 0.7)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TagListTask(),
                  SizedBox(height: 20),
                  DateTimePickers(),
                  SizedBox(height: 20),
                  TextField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    maxLines: null,
                    controller: taskDescription,
                    showCursor: true,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Locals.description,
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(230, 230, 230, 0.7)),
                    ),
                  )
                ],
              ),
            )),
        if (_needToShowStoreChange)
          GestureDetector(
            onTap: () => setState(() {
              _needToShowStoreChange = false;
            }),
            child: Scaffold(
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
              body: Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(64, 59, 59, 1),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          width: 1,
                        )),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 10, left: 10, right: 10),
                    height: deviceSize.height / 4,
                    width: deviceSize.width / 1.5,
                    constraints: BoxConstraints(
                        minHeight: deviceSize.height / 4,
                        minWidth: deviceSize.width / 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Locals.moveTaskToStore,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FlatButton(
                            color: _task.store == Store.SomeTime
                                ? Colors.blue
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () => _submitStore(Store.SomeTime),
                            padding: EdgeInsets.zero,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  child: Text(
                                    Locals.someTime,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                            color: _task.store == Store.AnyTime
                                ? Colors.blue
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () => _submitStore(Store.AnyTime),
                            padding: EdgeInsets.zero,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  child: Text(
                                    Locals.anyTime,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    )),
              ),
            ),
          ),
      ]),
    );
  }
}
