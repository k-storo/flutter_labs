import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => MyHomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(),
        body: _getMainPage(),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MyClickedButton() //MyClickedButton(),
        );
  }
}

final List<String> titles = <String>[
  'ToraDora',
  'Fate: Stay At Night',
  'Overlord Season 2',
  'Stein\'s Gate',
  'ToraDora',
  'Fate: Stay At Night',
  'Overlord Season 2',
  'Stein\'s Gate'
];
final List<String> images = <String>[
  'assets/images/anime4.jpg',
  'assets/images/anime3.jpg',
  'assets/images/anime2.png',
  'assets/images/anime1.jpg',
  'assets/images/anime4.jpg',
  'assets/images/anime3.jpg',
  'assets/images/anime2.png',
  'assets/images/anime1.jpg'
];

AppBar _getAppBar() {
  return AppBar(
    leading: const Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 16, left: 16.0),
      child: ClipOval(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
    ),
    title: Text(
      "crunchyroll",
      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => {},
      ),
    ],
  );
}

ListView _getMainPage() {
  return ListView(
    children: <Widget>[
      Container(
          height: 50,
          child: Center(
              child: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 20,
                  ),
                ),
                TextSpan(
                    text: " crunchyroll ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.orangeAccent)),
                TextSpan(
                    text: "ORIGINALS",
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.white)),
              ],
            ),
          ))),
      Container(
        height: 300,
        padding: EdgeInsets.all(10),
        child: Wrap(
            runAlignment: WrapAlignment.end,
            spacing: 20, // to apply margin in the main axis of the wrap
            runSpacing: 20,
            children: <Widget>[
              Text(
                "БОГ СТАРШЕЙ ШКОЛЫ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              FlatButton(
                onPressed: () => {},
                color: Colors.orange,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.play_arrow_outlined),
                    Text("Смотреть онлайн"),
                  ],
                ),
              ),
            ]),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/big_promo_2.jpeg'),
              fit: BoxFit.fitHeight),
        ),
      ),
      horizontalListView('Популярное', titles, images),
      big_promo(
          'assets/images/big_promo_1.jpg',
          'assets/images/anime3.jpg',
          'Fate: Stay At Night',
          'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum'),
      big_promo(
          'assets/images/big_promo_3.jpg',
          'assets/images/anime4.jpg',
          'Naruto: Blood Prison',
          'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum'),
      horizontalListView('В тренде', titles, images),
      horizontalListView('Онгоинги', titles, images),
      big_promo('assets/images/big_promo_2.jpeg', 'assets/images/anime6.jpg',
          'Tora Dora', 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum'),
      horizontalListView('Приключения/Экшн', titles, images),
    ],
  );
}

FloatingActionButton _getFloatingButton() {
  return FloatingActionButton.extended(
    icon: Icon(Icons.monetization_on),
    label: Text('ОФОРМИТЬ ПРЕМИУМ'),
    backgroundColor: Colors.orangeAccent,
    onPressed: () {},
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
  );
}

class MyClickedButton extends StatefulWidget {
  MyClickedButton({Key key, this.onPressed}) : super(key: key);

  // allow the widget that renders this widget to pass
  // in a callback for when the button is pressed
  final Function() onPressed;

  @override
  MyClickedButtonState createState() => MyClickedButtonState();
}

class MyClickedButtonState extends State<MyClickedButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: pressed ? Icon(Icons.monetization_on) : Icon(Icons.military_tech),
      label: pressed ? Text('ОФОРМИТЬ ПРЕМИУМ') : Text('ПРЕМИУМ ПОЛЬЗОВАТЕЛЬ'),
      backgroundColor: pressed ? Colors.orangeAccent : Colors.green,
      onPressed: () {
        setState(() => {pressed = !pressed});
        // call the callback that was passed in from the parent widget
        widget.onPressed();
      },
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
    );
  }
}

Widget horizontalListView(title, titles, images) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "$title",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            )),
        Container(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: titles.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    color: Colors.blueGrey,
                    width: 150,
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("${images[index]}",
                              width: 150, height: 200, fit: BoxFit.cover),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${titles[index]}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Сериал",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.cyanAccent[400],
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Озвучка",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(Icons.more_vert_sharp)
                                      ],
                                    )
                                  ]))
                        ]));
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ))
      ]);
}

Widget big_promo(img_big, img_small, title, desc) {
  return Stack(
    children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.topCenter,
          child: Image.asset("$img_big"),
          height: 350,
          color: Colors.blueGrey),
      Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 140, right: 10.0, left: 10.0),
        child: Container(
            height: 200.0,
            width: 800,
            child: Card(
              color: Color(0x00000000),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Image.asset("$img_small",
                          width: 150, height: 200, fit: BoxFit.cover)),
                  Expanded(
                      flex: 7,
                      child: Container(
                          //width: 400,
                          padding:
                              EdgeInsets.only(top: 50, left: 10, right: 10),
                          child: Wrap(
                            direction: Axis.vertical,
                            runAlignment: WrapAlignment.end,
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                              Text("$title",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text("$desc",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Сериал",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.cyanAccent[400],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(Icons.more_vert_sharp)
                                ],
                              )
                            ],
                          )))
                ],
              ),
            )),
      ),
    ],
  );
}
