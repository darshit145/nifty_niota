import 'package:flutter/material.dart';

class MyScrollTabListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyScrollTabListHomePage(),
    );
  }
}

class MyScrollTabListHomePage extends StatefulWidget {
  @override
  MyScrollTabListHomePageState createState() => MyScrollTabListHomePageState();
}

class MyScrollTabListHomePageState extends State<MyScrollTabListHomePage>
    with SingleTickerProviderStateMixin {
  final int _tabCount = 8;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabCount, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              expandedHeight: 240.0,
              title: Text("Title"),
              pinned: true,
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: List<Tab>.generate(_tabCount, (int i) {
                  return Tab(text: "TAB$i");
                }),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: List<Widget>.generate(_tabCount, (int i) {
            return Text('Content for Tab $i');
          }),
        ),
      ),
    );
  }
}
