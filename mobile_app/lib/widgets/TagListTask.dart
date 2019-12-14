import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Stores/Tasks.dart';
import '../Stores/Task.dart';

import '../widgets/AddTagButton.dart';

class TagListTask extends StatefulWidget {
  TagListTask();

  _TagListTaskState createState() => _TagListTaskState();
}

class _TagListTaskState extends State<TagListTask> {

  bool _isSelectedTag(int id){
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<String> tags;

    if (Provider.of<Task>(context, listen: false).id == null) {
      tags = Provider.of<Tasks>(context).allTags;
    }
    else{
      tags = Provider.of<Task>(context).tags;
    }
    
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length + 1,
        itemBuilder: (BuildContext context, int i) {
          return i == tags.length ? AddTagButton() : GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: () => {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 10),
              constraints: BoxConstraints(minWidth: 70, maxWidth: 180),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(
                      width: 2,
                      color: _isSelectedTag(i)
                          ? Colors.blue
                          : Color.fromRGBO(196, 196, 196, 1))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      tags[i],
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
