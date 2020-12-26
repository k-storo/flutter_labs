import 'package:crunchyroll_app/screens/elements/SortFilterBar.dart';
import 'package:crunchyroll_app/screens/title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:crunchyroll_app/models/catalog.dart';
import 'package:crunchyroll_app/screens/elements/AddFavouriteButton.dart';
import 'package:crunchyroll_app/screens/elements/AddWatchedButton.dart';
import 'package:crunchyroll_app/common/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';

class ItemsList extends StatelessWidget {
  final List<Item> items;

  ItemsList({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SortFilterBar(),
            Expanded(
                child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                height: 250,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.blueGrey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(items[index].picture,
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  items[index].name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: items[index].type,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.cyanAccent[400],
                                              fontWeight: FontWeight.w600)),
                                      WidgetSpan(
                                        child:
                                            Icon(Icons.bubble_chart, size: 14),
                                      ),
                                      TextSpan(
                                          text: items[index].watchType,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        ButtonBar(
                          children: [
                            IconButton(
                              focusColor: Colors.green,
                              highlightColor: Colors.orange,
                              icon: Icon(Icons.play_circle_filled),
                              tooltip: 'Смотреть онлайн',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AnimeTitle(items[index]),
                                  ),
                                );
                              },
                            ),
                            AddFavouriteButton(
                              item: items[index],
                            ),
                            AddWatchedButton(
                              item: items[index],
                            )
                          ],
                        ),
                      ]),
                );
              },
            ))
          ],
        ));
  }
}
