import 'package:flutter/material.dart';

import 'package:crunchyroll_app/screens/elements/MyAppBarCatalog.dart';
import 'package:crunchyroll_app/screens/elements/MyListItem.dart';
import 'package:crunchyroll_app/screens/elements/SortFilterBar.dart';

class MyCatalog extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MyCatalog(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyAppBar(),
          SliverToBoxAdapter(child: SortFilterBar()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => MyListItem(index)),
          ),
        ],
      ),
    );
  }
}
