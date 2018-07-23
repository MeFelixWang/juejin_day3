import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'hot.dart';
import 'discovery.dart';
import 'book.dart';
import 'mine.dart';

class IndexPage extends StatefulWidget {
  @override
  createState() => new IndexPageState();
}

class IndexPageState extends State<IndexPage> {
//  定义底部导航列表
  final List<BottomNavigationBarItem> bottomTabs = [
    new BottomNavigationBarItem(
      icon: new Icon(CupertinoIcons.home),
      title: new Text('首页'),
    ),
    new BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.search), title: new Text('发现')),
    new BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.conversation_bubble),
        title: new Text('沸点')),
    new BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.book), title: new Text('小册')),
    new BottomNavigationBarItem(
        icon: new Icon(CupertinoIcons.profile_circled), title: new Text('我'))
  ];
  final List<Widget> tabBodies = [
    new HomePage(),
    new DiscoveryPage(),
    new HotPage(),
    new BookPage(),
    new MinePage()
  ];
  int currentIndex = 0; //当前索引
  Widget currentPage; //当前页面

  @override
  void initState() {
    super.initState();
    currentPage = tabBodies[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = tabBodies[currentIndex];
            });
          }),
      body: currentPage,
    );
  }
}
