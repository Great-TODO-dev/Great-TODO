import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Stores/Task.dart';
import '../Stores/Tasks.dart';

class AddTagButton extends StatefulWidget {
  _AddTagButtonState createState() => _AddTagButtonState();
}

class _AddTagButtonState extends State<AddTagButton> {
  final TextEditingController _tag = TextEditingController();
  Function _addNewTag;

  @override
  void initState() {
    super.initState();
    _addNewTag = Provider.of<Task>(context, listen: false).addTag;
  }

  bool _isLabel = true;

  void _submitNewTag() {
    Provider.of<Tasks>(context, listen: false).registerNewTag(_tag.text);
    _addNewTag(_tag.text);
    _isLabel = true;
  }

  @override
  Widget build(BuildContext context) {
    return _isLabel
        ? GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: () => setState(() {
              _isLabel = false;
            }),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    border: Border.all(
                        width: 2, color: Color.fromRGBO(196, 196, 196, 1))),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Icon(Icons.label),
                  ],
                )),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 10),
            constraints: BoxConstraints(minWidth: 70, maxWidth: 140),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                border: Border.all(
                    width: 2, color: Color.fromRGBO(196, 196, 196, 1))),
            child: TextField(
              onSubmitted: (_) => _submitNewTag(),
              controller: _tag,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(border: InputBorder.none),
            ),
          );
  }
}
