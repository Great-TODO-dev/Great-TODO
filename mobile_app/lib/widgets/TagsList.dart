import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Stores/Tasks.dart';

class TagList extends StatefulWidget {
  TagList();

  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  @override
  Widget build(BuildContext context) {
    final tags = Provider.of<Tasks>(context).tags;
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 15),
            constraints: BoxConstraints(minWidth: 70, maxWidth: 180),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              border: Border.all(width: 2, color: Color.fromRGBO(196, 196, 196, 1))
            ),
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
          );
        },
      ),
    );
  }
}
