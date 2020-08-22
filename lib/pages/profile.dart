import 'package:flutter/cupertino.dart';

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
          middle: Text('Info Page'),
          // backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          backgroundColor: CupertinoColors.activeBlue,
        ),
        child: Text('ProfilePage'));
  }
}
