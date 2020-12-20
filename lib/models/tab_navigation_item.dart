import 'package:flutter/material.dart';

import 'package:crunchyroll_app/screens/home.dart';
import 'package:crunchyroll_app/screens/wip.dart';
import 'package:crunchyroll_app/screens/catalog.dart';
import 'package:crunchyroll_app/screens/favourites.dart';

class TabNavigationItem {
  final Widget page;
  final Widget label;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.label,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: MyHomePage(),
          icon: Icon(Icons.home_outlined),
          label: Text("Главная"),
        ),
        TabNavigationItem(
          page: MyFavourites(),
          icon: Icon(Icons.bookmark_border_outlined),
          label: Text("Закладки"),
        ),
        TabNavigationItem(
          page: MyCatalog(),
          icon: Icon(Icons.border_all_outlined),
          label: Text("Каталог"),
        ),
        TabNavigationItem(
          page: MyWorkInProgress(),
          icon: Icon(Icons.star_outline_outlined),
          label: Text("Онгоинги"),
        ),
        TabNavigationItem(
          page: MyWorkInProgress(),
          icon: Icon(Icons.account_circle_outlined),
          label: Text("Профиль"),
        ),
      ];
}
