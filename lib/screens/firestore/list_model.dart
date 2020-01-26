import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class ListViewModel {
  Stream<QuerySnapshot> getListStream() {
    return Firestore.instance.collection('schedules').snapshots();
  }
}
