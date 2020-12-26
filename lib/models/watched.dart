import 'package:flutter/foundation.dart';
import 'package:crunchyroll_app/models/catalog.dart';

class WatchedModel extends ChangeNotifier {
  CatalogModel _catalog;

  final List<Item> _items = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    /*assert(_itemIds.every((id) => newCatalog.getById(id) != null),
        'The catalog $newCatalog does not have one of $_itemIds in it.');*/
    _catalog = newCatalog;

    notifyListeners();
  }

  List<Item> get items => _items;

  void add(Item item) {
    _items.add(item);

    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);

    notifyListeners();
  }
} //
