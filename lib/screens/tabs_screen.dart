import 'package:flutter/material.dart';
import 'package:crunchyroll_app/models/tab_navigation_item.dart';
import 'package:provider/provider.dart';
import 'package:crunchyroll_app/models/DarkThemeProvider.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: <BottomNavigationBarItem>[
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              title: tabItem.label,
            ),
        ],
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/anime4.jpg"),
                ),
                Text("Kostya Storozhuk"),
              ],
            ),
          ),
          SwitchListTile(
            title: Text('Ночной режим'),
            value: themeChange.darkTheme,
            onChanged: (bool value) {
              themeChange.darkTheme = value;
            },
            secondary: Icon(Icons.nights_stay_outlined),
          ),
          ListTile(
            leading: Icon(Icons.ondemand_video_outlined),
            title: Text('Список аниме'),
            onTap: () => Navigator.pushNamed(context, '/watched'),
          ),
          ListTile(
            leading: Icon(Icons.book_outlined),
            title: Text('Список манги'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.casino_outlined),
            title: Text('Достижения'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_outlined),
            title: Text('Клубы'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.chat_outlined),
            title: Text('Почта'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.red,
            ),
            title: Text(
              'Выйти',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
