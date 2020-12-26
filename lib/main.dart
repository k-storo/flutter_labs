import 'package:crunchyroll_app/screens/home.dart';
import 'package:crunchyroll_app/screens/profile.dart';
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
import 'package:crunchyroll_app/models/DarkThemeProvider.dart';
import 'package:crunchyroll_app/common/Styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
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
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            title: 'Crunchyroll',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: TabsPage(),
            initialRoute: '/',
            routes: {
              '/catalog': (context) => MyCatalog(),
              '/favourites': (context) => MyFavourites(),
              '/watched': (context) => MyWatched(),
              '/home': (context) => MyHomePage(),
              '/wip': (context) => MyWorkInProgress(),
              '/profile': (context) => MyProfile()
            },
            debugShowCheckedModeBanner: false,
          );
        }));
  }
} //
