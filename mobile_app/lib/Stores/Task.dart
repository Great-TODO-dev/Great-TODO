import 'package:flutter/cupertino.dart';

class Task with ChangeNotifier {
  int _id;
  String _name;
  String _description;
  bool _doneState;
  dynamic _subIssues;
  DateTime _date;
  DateTime _deadline;

  Task([this._name = '', this._description = '']) {
    _id = null;
    _doneState = false;
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

  void changeDoneState(){
    _doneState = !_doneState;
    notifyListeners();
  }

  void generateId() {
    // TODO: implement generate ID pattern
    _id = 4;
  }
}
