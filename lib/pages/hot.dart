import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HotPage extends StatefulWidget {
  @override
  HotPageState createState() => new HotPageState();
}

class HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: new TabBar(
              tabs: [
                new Tab(
                  text: '话题',
                ),
                new Tab(
                  text: '推荐',
                ),
                new Tab(
                  text: '动态',
                ),
              ],
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
            ),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.mode_edit),
                  onPressed: () {
                    Navigator.pushNamed(context, '/putHot');
                  })
            ],
          ),
          body: new TabBarView(children: []),
        ));
  }
}
