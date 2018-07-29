import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/httpHeaders.dart';

class TopicPage extends StatefulWidget {
  @override
  TopicPageState createState() => new TopicPageState();
}

class TopicPageState extends State<TopicPage> {
  List topicList;

  Future getTopics() async {
    final response = await http.get(Uri.encodeFull(
        'https://short-msg-ms.juejin.im/v1/topicList/recommend?uid=${httpHeaders['X-Juejin-Uid']}&device_id=${httpHeaders['X-Juejin-Client']}&token=${httpHeaders['X-Juejin-Token']}&src=${httpHeaders['X-Juejin-Src']}'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load topics');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FutureBuilder(future: getTopics(),builder: (context,snapshot){

    });
  }
}