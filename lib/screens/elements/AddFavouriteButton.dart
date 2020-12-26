import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crunchyroll_app/models/favourites.dart';
import 'package:crunchyroll_app/models/catalog.dart';

class AddFavouriteButton extends StatelessWidget {
  final Item item;

  const AddFavouriteButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavourites = context.select<FavouritesModel, bool>(
      (favourites) => favourites.items.contains(item),
    );

    return IconButton(
      tooltip: isInFavourites ? 'Добавлено' : 'Добавить в закладки',
      onPressed: () {
        if (!isInFavourites) {
          var favourites = context.read<FavouritesModel>();
          favourites.add(item);
        }
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
