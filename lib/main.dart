import 'package:crunchyroll_app/screens/home.dart';
import 'package:crunchyroll_app/screens/wip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crunchyroll_app/models/favourites.dart';
import 'package:crunchyroll_app/models/catalog.dart';
import 'package:crunchyroll_app/screens/favourites.dart';
import 'package:crunchyroll_app/screens/catalog.dart';
import 'package:crunchyroll_app/screens/tabs_screen.dart';
import 'package:crunchyroll_app/models/watched.dart';
import 'package:crunchyroll_app/screens/watched.dart';

//lab3
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, FavouritesModel>(
          create: (context) => FavouritesModel(),
          update: (context, catalog, favourites) {
            favourites.catalog = catalog;
            return favourites;
          },
        ),
        ChangeNotifierProxyProvider<CatalogModel, WatchedModel>(
          create: (context) => WatchedModel(),
          update: (context, catalog, watched) {
            watched.catalog = catalog;
            return watched;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Crunchyroll',
        theme: ThemeData.dark(),
        home: TabsPage(),
        initialRoute: '/',
        routes: {
          '/catalog': (context) => MyCatalog(),
          '/favourites': (context) => MyFavourites(),
          '/watched': (context) => MyWatched(),
          '/home': (context) => MyHomePage(),
          '/wip': (context) => MyWorkInProgress(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
