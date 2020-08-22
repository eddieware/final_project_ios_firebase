import 'package:final_project_ios_firebase/pages/card_page.dart';
import 'package:final_project_ios_firebase/pages/followers.dart';
import 'package:final_project_ios_firebase/pages/profile.dart';
import 'package:final_project_ios_firebase/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          title: Text('Info'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person_solid),
          title: Text('Animation'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.share_up),
          title: Text('Cards'),
        ),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          // here to get the number of cases and know wich is selected
          routes: getApplicationRoutes(),
          builder: (context) {
            switch (index) {
              case 0:
                return ProfilePage();
                break;
              case 1:
                return FollowersPage();
                break;
              case 2:
                return CardScreen();
                break;
            }
            return HomeScreen();
          },
        );
      },
    );
  }
}

class InfoPage {}
