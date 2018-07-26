import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../utils/countTime.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String searchContent;
  List searchResult;

  Future search(String query) {
    return http.get(
        'https://search-merger-ms.juejin.im/v1/search?query=$query&page=0&raw_result=false&src=web');
  }

  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
            pinned: true,
            leading: new IconButton(
                icon: new Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: new Text(
              '搜索',
              style: new TextStyle(fontWeight: FontWeight.normal),
            ),
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.blue),
            backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
            bottom: new PreferredSize(
                child: new Container(
                  color: Colors.white,
                  padding: new EdgeInsets.all(5.0),
                  child: new Card(
                      color: new Color.fromRGBO(252, 252, 252, 0.6),
                      child: new Padding(
                        padding: new EdgeInsets.all(5.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Expanded(
                              child: new TextField(
                                autofocus: true,
                                style: new TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                                decoration: new InputDecoration(
                                  contentPadding: new EdgeInsets.all(0.0),
                                  border: InputBorder.none,
                                  hintText: '搜索',
                                  prefixIcon: new Icon(
                                    Icons.search,
                                    size: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                onChanged: (String content) {
                                  setState(() {
                                    searchContent = content;
                                  });
                                },
                                onSubmitted: (String content) {
                                  search(content).then((response) {
                                    setState(() {
                                      searchResult =
                                          json.decode(response.body)['d'];
                                    });
                                  }, onError: (e) {
                                    throw Exception('Failed to load data');
                                  });
                                },
                                controller: controller,
                              ),
                            ),
                            searchContent == ''
                                ? new Container(
                                    height: 0.0,
                                    width: 0.0,
                                  )
                                : new InkResponse(
                                    child: new Icon(
                                      Icons.close,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        searchContent = '';
                                        controller.text = '';
                                      });
                                    })
                          ],
                        ),
                      )),
                ),
                preferredSize: new Size.fromHeight(40.0))),
        searchResult == null
            ? new SliverFillRemaining(
                child: new Container(
                  color: Colors.white,
                ),
              )
            : new SliverList(
                delegate: new SliverChildBuilderDelegate((context, index) {
                var resultInfo = searchResult[index];
                return showResult(resultInfo);
              }, childCount: searchResult.length))
      ],
    );
  }

//显示搜索结果
  Widget showResult(resultInfo) {
    var publicTime = countTime(resultInfo['createdAt']);
    return new Container(
      alignment: Alignment.centerLeft,
      padding: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
              bottom: new BorderSide(width: 0.2, color: Colors.grey))),
      child: new FlatButton(
          onPressed: null,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text(
                resultInfo['title'],
                style: new TextStyle(color: Colors.black),
              ),
              new Text(
                '${resultInfo['collectionCount']}人喜欢 · ${resultInfo['user']['username']} · $publicTime',
                textAlign: TextAlign.left,
                style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                softWrap: true,
              )
            ],
          )),
    );
  }
}
