import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/discover.dart';
import 'screens/favourites.dart';
import 'states/app_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppModel(),
    child: App()
  ));
}

class App extends StatelessWidget {
  final List<Widget> _children = [
    Discover(),
    Favourites()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, app, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: const Color(0xffdedede),
            body: Container(
              padding: const EdgeInsets.only(
                top: 80,
                left: 25,
                right: 25,
              ),
              child: _children[app.tabIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                app.tabIndex = index;
              },
              currentIndex: app.tabIndex,
              backgroundColor: const Color(0xffdedede),
              selectedItemColor: const Color(0xff000000),
              unselectedItemColor: const Color(0xffc1c1c1),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/album-outline/albums-outline.png')),
                  activeIcon: ImageIcon(AssetImage('assets/icons/album/albums.png')),
                  title: Text('Discover'),
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/icons/heart-outline/heart-outline.png')),
                  activeIcon: ImageIcon(AssetImage('assets/icons/heart/heart.png')),
                  title: Text('Favourites'),
                ),
              ]
            ),
          )
        );
      }
    );
  }
}