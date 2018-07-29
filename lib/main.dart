import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'actions/actions.dart';
import 'reducers/reducers.dart';
import 'pages/index.dart';
import 'pages/search.dart';
import 'pages/activities.dart';
import 'pages/signin.dart';

void main() {
  final userInfo = new Store<Map>(getUserInfo, initialState: {});

  runApp(new MyApp(
    store: userInfo,
  ));
}

class MyApp extends StatelessWidget {
  final Store<Map> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
          home: new IndexPage(),
          theme: new ThemeData(
              highlightColor: Colors.transparent,
              //将点击高亮色设为透明
              splashColor: Colors.transparent,
              //将喷溅颜色设为透明
              bottomAppBarColor: new Color.fromRGBO(244, 245, 245, 1.0),
              //设置底部导航的背景色
              scaffoldBackgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
              //设置页面背景颜色
              primaryIconTheme: new IconThemeData(color: Colors.blue),
              //主要icon样式，如头部返回icon按钮
              indicatorColor: Colors.blue,
              //设置tab指示器颜色
              iconTheme: new IconThemeData(size: 18.0),
              //设置icon样式
              primaryTextTheme: new TextTheme(
                  //设置文本样式
                  title: new TextStyle(color: Colors.black, fontSize: 16.0))),
          routes: <String, WidgetBuilder>{
            '/search': (BuildContext context) => SearchPage(),
            '/activities': (BuildContext context) => ActivitiesPage(),
            '/signin': (BuildContext context) => SignInPage(),
          },
        ));
  }
}
