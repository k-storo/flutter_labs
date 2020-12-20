class CatalogModel {
  static List<String> itemNames = [
    'Naruto',
    'Fate: Stay at Night',
    'Tora Dora',
    'Boruto',
    'Steins Gate',
    'God Eater',
    'God Of Highschool',
    'Evangelion',
    'Fullmetal Alchemist',
    'Shaman King',
    'Future Diary',
    'Overlord',
    'Madoka Magica',
  ];

  static List itemPictures = [
    'assets/images/anime1.jpg',
    'assets/images/anime2.png',
    'assets/images/anime3.jpg',
    'assets/images/anime4.jpg',
    'assets/images/anime5.jpg',
    'assets/images/anime6.jpg',
    'assets/images/anime7.jpg',
  ];

  static List<int> watchingHoursList = [2, 4, 8, 16, 32, 120];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String picture;
  int viewCount = 2943;
  final int watchingHours;

  Item(this.id, this.name)
      : picture =
            CatalogModel.itemPictures[id % CatalogModel.itemPictures.length],
        watchingHours = CatalogModel
            .watchingHoursList[id % CatalogModel.watchingHoursList.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
