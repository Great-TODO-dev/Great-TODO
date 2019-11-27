import 'package:flutter/cupertino.dart';

class Task with ChangeNotifier {
  int _id;
  String _name;
  String _description;
  bool _doneState;
  dynamic _subIssues;
  DateTime _date;
  DateTime _deadline;
  List<String> _tags;

  Task([this._name = '', this._description = '']) {
    _id = null;
    _doneState = true;
    _tags =[
      'fast',
      'hard'
    ];
  }

  set name(name) => _name = name;

  set description(description) => _description = description;

  set deadline(deadline) => _deadline = deadline;

  set date(date) => _date = date;

  set doneState(doneState) => _doneState = doneState;

  String get name => _name;

  String get description => _description;

  DateTime get deadline => _deadline;

  DateTime get date => _date;

  int get id => _id;

  bool get doneState => _doneState;

  List<String> get tags => _tags;

  void addTag(tag){
    if (!_tags.contains(tag)) {
      _tags.add(tag);
    }
  }

  void removeTag(tag){
    if (_tags.length != 0) {

    }
  }

  void changeDoneState() {
    _doneState = !_doneState;
    notifyListeners();
  }

  void setId(id) {
    if (_id == null) {
      _id = id;
    }
    return;
  }
}
