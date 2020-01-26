import 'package:flutter/material.dart';

import 'form.dart';
import 'list.dart';

class IndexPageTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexPageTabViewState();
}

class IndexPageTabViewState extends State<IndexPageTabView>
    with SingleTickerProviderStateMixin {
  final _tabs = <Tab>[
    Tab(icon: Icon(Icons.list)),
    Tab(icon: Icon(Icons.add)),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('予定管理'),
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabs,
            )),
        body: TabBarView(
            controller: _tabController,
            children: [ListPage(), FireStoreForm()]));
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
