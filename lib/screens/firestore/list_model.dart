import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practice/domain/schedule.dart';
import 'package:intl/intl.dart';

class ListViewModel {
  Future<List<Schedule>> getList() async {
    QuerySnapshot schedules =
        await FirebaseFirestore.instance.collection('schedules').get();

    List<Schedule> list =
        schedules.docs.map<Schedule>((QueryDocumentSnapshot snapshot) {
      return Schedule.fromMap(
          {...snapshot.data(), 'date': snapshot.data()['date']?.toDate()});
    }).toList();

    return list;
  }

  String formatDate(DateTime date) {
    if (date == null) {
      return '';
    }
    DateFormat format = DateFormat('y年MM月DD日');
    return format.format(date);
  }
}
