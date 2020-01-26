import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/domain/schedule.dart';
import 'package:provider/provider.dart';

import 'list_model.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScheduleListSection();
  }
}

class ScheduleListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<ListViewModel>(create: (_) => ListViewModel())],
        child: Consumer<ListViewModel>(
            builder: (BuildContext context, ListViewModel model, Widget child) {
          return StreamBuilder<QuerySnapshot>(
              stream: model.getListStream(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Text('取得に失敗しました');
                }

                if (!snapshot.hasData) {
                  return Column(children: [CircularProgressIndicator()]);
                }

                return ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                  Schedule schedule = Schedule.fromMap({
                    ...document.data,
                    'date': document.data['date']?.toDate()
                  });
                  return ListTile(
                      contentPadding: EdgeInsets.all(3.0),
                      title: Text(schedule.name),
                      leading: Text(schedule.date.toString()));
                }).toList());
              });
        }));
  }
}
