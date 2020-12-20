import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crunchyroll_app/models/favourites.dart';

class MyFavourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Закладки'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: _FavouritesList(),
              ),
            ),
            Divider(height: 4, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class _FavouritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;

    var favourites = context.watch<FavouritesModel>();

    return ListView.builder(
      itemCount: favourites.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(favourites.items[index].picture),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever_outlined),
          onPressed: () {
            favourites.remove(favourites.items[index]);
          },
        ),
        title: Text(
          favourites.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}
