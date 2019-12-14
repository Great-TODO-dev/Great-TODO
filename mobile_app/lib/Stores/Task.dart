import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

enum Store{
  AnyTime,
  SomeTime
}

class Task with ChangeNotifier {
  int _id;
  String _name;
  String _description;
  bool _doneState;
  dynamic _subIssues;
  DateTime _date;
  DateTime _deadline;
  List<String> _tags;
  Store _store;

  Function _addNewTag;

  Task([this._name = '', this._description = '', this._tags]) {
    store = Store.SomeTime;
    // TODO:remove after implementation storage
    _date = DateTime.now();
    _id = null;
    _doneState = true;
    if (_tags == null) {
      _tags = [
        'fast',
        'hard',
      ];
    }
  }

  set name(name) => _name = name;

  set description(description) => _description = description;

  set deadline(deadline) => _deadline = deadline;

  set date(date) => _date = date;

  set doneState(doneState) => _doneState = doneState;

  set store(newStore) => _store = newStore;

  String get name => _name;

  String get description => _description;

  DateTime get deadline => _deadline;

  DateTime get date => _date;

  int get id => _id;

  bool get doneState => _doneState;

  Store get store => _store;

  List<String> get tags => _tags;

  void setDeadline(DateTime date) => date != null ? _deadline = date : '';

  void setDate(DateTime date) => date != null ? _date = date : '';

  void clearDeadLine() => _deadline = null;

  void clearDate() => _date = null;

  void addTag(tag) {
    if (!_tags.contains(tag)) {
      _tags.add(tag);
      notifyListeners();
    }
  }

  void removeTag(tag) {
    if (_tags.length != 0) {}
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

  bool isDeadlineToday() {
    final today = DateTime.now();
    if (today.month == _deadline.month &&
        today.day == _deadline.day &&
        today.year == _deadline.year) {
      return true;
    }
    return false;
  }
}
