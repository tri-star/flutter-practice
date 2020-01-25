import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/domain/schedule.dart';
import 'package:intl/intl.dart';

class FormViewModel with ChangeNotifier {
  final Schedule _schedule = Schedule();

  String get name => _schedule.name;
  String get memo => _schedule.memo;
  DateTime get date => _schedule.date;
  String get formattedDate => getFormattedDate(_schedule.date);

  String get url => _schedule.url;

  set name(String value) {
    if (_schedule.name != value) {
      _schedule.name = value;
      notifyListeners();
    }
  }

  set memo(String value) {
    if (_schedule.memo != value) {
      _schedule.memo = value;
      notifyListeners();
    }
  }

  set date(DateTime value) {
    if (_schedule.date != value) {
      _schedule.date = value;
      notifyListeners();
    }
  }

  set url(String value) {
    if (_schedule.url != value) {
      _schedule.url = value;
      notifyListeners();
    }
  }

  String validateName(String value) =>
      _schedule.validateName(value)?.message ?? null;

  void register() async {
    Firestore.instance.collection('schedules').add(<String, dynamic>{
      'name': _schedule.name,
      'date': _schedule.date,
      'memo': _schedule.memo,
      'url': _schedule.url,
    });
  }

  void clear() {
    name = '';
    date = null;
    memo = '';
    url = '';
  }

  String getFormattedDate(DateTime date) {
    if (date == null) {
      return '';
    }
    DateFormat dateFormat = DateFormat('y-MM-DD');
    return dateFormat.format(date);
  }
}
