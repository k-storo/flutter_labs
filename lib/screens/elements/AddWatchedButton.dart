import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crunchyroll_app/models/watched.dart';
import 'package:crunchyroll_app/models/catalog.dart';

class AddWatchedButton extends StatelessWidget {
  final Item item;

  const AddWatchedButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInWatched = context.select<WatchedModel, bool>(
      (watched) => watched.items.contains(item),
    );

    return IconButton(
      tooltip: isInWatched ? 'Просмотрено' : 'Добавить в просмотренное',
      onPressed: () {
        if (!isInWatched) {
          var watched = context.read<WatchedModel>();
          watched.add(item);
        }
      },
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
