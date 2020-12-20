import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crunchyroll_app/models/favourites.dart';
import 'package:crunchyroll_app/models/watched.dart';
import 'package:crunchyroll_app/models/catalog.dart';

class MyCatalog extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MyCatalog(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: _SortFilterBar()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)),
          ),
        ],
      ),
    );
  }
}

class _AddFavouriteButton extends StatelessWidget {
  final Item item;

  const _AddFavouriteButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavourites = context.select<FavouritesModel, bool>(
      (favourites) => favourites.items.contains(item),
    );

    return IconButton(
      onPressed: isInFavourites
          ? null
          : () {
              var favourites = context.read<FavouritesModel>();
              favourites.add(item);
            },
      highlightColor: Colors.orange,
      icon: isInFavourites
          ? Icon(
              Icons.bookmark,
              color: Colors.orange,
              semanticLabel: 'ADDED',
              size: 20,
            )
          : Icon(
              Icons.bookmark_border_outlined,
              semanticLabel: 'ADDED',
              size: 20,
            ),
    );
  }
}

class _SortFilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 2, 0, 2),
        child: Row(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text("Популярное",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400))),
            Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.sort_outlined),
                        onPressed: () {}),
                    IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.filter_alt_outlined),
                        onPressed: () {})
                  ],
                ))
          ],
        ));
  }
}

class _AddWatchedButton extends StatelessWidget {
  final Item item;

  const _AddWatchedButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInWatched = context.select<WatchedModel, bool>(
      (watched) => watched.items.contains(item),
    );

    return IconButton(
      onPressed: isInWatched
          ? null
          : () {
              var watched = context.read<WatchedModel>();
              watched.add(item);
            },
      highlightColor: Colors.greenAccent,
      icon: isInWatched
          ? Icon(
              Icons.done_all_sharp,
              color: Colors.green,
              semanticLabel: 'ADDED',
              size: 20,
            )
          : Icon(
              Icons.done_all_sharp,
              semanticLabel: 'ADDED',
              size: 20,
            ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Каталог',
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _MyListItem extends StatefulWidget {
  final int index;
  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  _MyListItemState createState() => _MyListItemState();
}

class _MyListItemState extends State<_MyListItem> {
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
                      children: [_AddWatchedButton(item: item)],
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
                              _AddFavouriteButton(item: item),
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
