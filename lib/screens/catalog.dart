import 'package:crunchyroll_app/screens/elements/MyAppBarCatalog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crunchyroll_app/models/catalog.dart';

import 'package:crunchyroll_app/screens/elements/ItemsList.dart';

class MyCatalog extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MyCatalog(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarCatalog(),
      body: FutureBuilder<List<Item>>(
        future: fetchItems(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemsList(items: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
