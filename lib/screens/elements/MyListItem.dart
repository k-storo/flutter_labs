import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crunchyroll_app/models/catalog.dart';

import 'package:crunchyroll_app/screens/elements/AddFavouriteButton.dart';
import 'package:crunchyroll_app/screens/elements/AddWatchButton.dart';

class MyListItem extends StatefulWidget {
  final int index;
  MyListItem(this.index, {Key key}) : super(key: key);

  @override
  _MyListItemState createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
  int _counter = 0;

  void _incrementViewCounter() {
    setState(() {
      _counter++;
    });
    //_counter = item.viewCount;
  }

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(widget.index),
    );

    int finalViewCount = _counter + item.viewCount;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
            color: Colors.blueGrey,
            height: 210,
            child: Row(
              children: [
                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [AddWatchedButton(item: item)],
                    ),
                    width: MediaQuery.of(context).size.width * 0.1),
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(item.picture),
                      fit: BoxFit.cover,
                    )),
                    width: MediaQuery.of(context).size.width * 0.3),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              AddFavouriteButton(item: item),
                            ]),
                        Text(
                            "Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\""),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Сериал",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.cyanAccent[400],
                                          fontWeight: FontWeight.w600)),
                                  WidgetSpan(
                                    child: Icon(Icons.bubble_chart, size: 14),
                                  ),
                                  TextSpan(
                                      text: "Озвучка",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('$finalViewCount'),
                            IconButton(
                              onPressed: _incrementViewCounter,
                              icon: Icon(Icons.favorite),
                            ),
                          ],
                        )
                      ]),
                )
              ],
            )));
  }
}
