// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crunchyroll_app/models/watched.dart';

class MyWatched extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Список аниме'), //style: Theme.of(context).textTheme.headline1),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: _WatchedList(),
              ),
            ),
            Divider(height: 4, color: Colors.white),
            _WatchedTotal()
          ],
        ),
      ),
    );
  }
} //

class _WatchedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;

    var favourites = context.watch<WatchedModel>();

    return ListView.builder(
      itemCount: favourites.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(favourites.items[index].picture),
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

class _WatchedTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Статистика за все время:\n'),
            SizedBox(width: 24),
            Consumer<WatchedModel>(
                builder: (context, watched, child) => Text(
                    'Количество просмотренных тайтлов: ${context.watch<WatchedModel>().items.length}.\n')),
            SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
