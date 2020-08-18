import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Food App'),
        backgroundColor: CupertinoColors.activeOrange,
      ),
      child: Container(
        //color: CupertinoColors.activeBlue,
        child: Card(
            margin: EdgeInsets.all(16.0),
            shadowColor: CupertinoColors.inactiveGray,
            elevation: 10,
            child: Text('Profile Page')),
      ),
    );
  }
}
