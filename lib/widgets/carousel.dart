import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  List itemList;

  @override
  Carousel({Key key, this.itemList}) : super(key: key);

  @override
  CarouselState createState() => new CarouselState();
}

class CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: widget.itemList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
        length: widget.itemList.length,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Positioned(
                child: new PreferredSize(
              child: new Container(
                height: 48.0,
              ),
              preferredSize: const Size.fromHeight(48.0),
            )),
            new TabBarView(
                children: widget.itemList.map((item) {
              return new Image.network(item['screenshot']);
            }).toList())
          ],
        ));
    /*  return new PreferredSize(
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Positioned(
                bottom: 0.0,
                child: new PreferredSize(
                    child: new Container(
                      height: 48.0,
                      alignment: Alignment.center,
                      child: TabPageSelector(
                        controller: _tabController,
                      ),
                    ),
                    preferredSize: null)),
            new TabBarView(
                children: widget.itemList.map((item) {
              return new Image.network(item['screenshot']);
            }).toList())
          ],
        ),
        preferredSize: const Size.fromHeight(80.0));*/
  }
}
