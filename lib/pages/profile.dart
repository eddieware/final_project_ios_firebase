import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.activeBlue,
          middle: Text('Profile'),
        ),
        child: Container(
          color: CupertinoColors.black,
          child: ListView(
            children: <Widget>[
              Text(
                'text',
                style: TextStyle(fontSize: 26),
              )
            ],
          ),
        ));
  }
}
