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
          return FutureBuilder<List<Schedule>>(
              future: model.getList(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Schedule>> snapshot) {
                if (snapshot.hasError) {
                  return Text('取得に失敗しました');
                }

                if (!snapshot.hasData) {
                  return Column(children: [CircularProgressIndicator()]);
                }

                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildListItem(model, snapshot.data[index]),
                );
              });
        }));
  }

  Widget buildListItem(ListViewModel model, Schedule schedule) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Card(
          margin: EdgeInsets.only(top: 5),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.formatDate(schedule.date),
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                  ),
                  Text(
                    schedule.name,
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ))),
    );
  }
}

/*
        Text(
          model.formatDate(schedule.date),
          style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
        ),
        Text(
          schedule.name,
          style: TextStyle(fontSize: 20.0),
        )

* */
